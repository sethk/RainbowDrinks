//
//  RDNewUserViewController.m
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RDNewUserViewController.h"
#import "RDStorage.h"
#import "RDUser.h"

@implementation RDNewUserViewController

- (void)_validateFields
{
	NSString *firstName = [_firstNameField text], *lastName = [_lastNameField text];
	NSString *errorText = @"";
	BOOL isValid = NO;
	if ([firstName length] && [lastName length])
	{
		if ([[RDStorage sharedStorage] userWithFirstName:firstName lastName:lastName])
			errorText = _(@"Sorry, this name is already being used.  Please add a middle name or initial.");
		else
			isValid = YES;
	}

	[_nameErrorLabel setText:errorText];
	[_showLocationButton setEnabled:isValid];
}

- (void)_nameChanged:(NSNotification *)notification
{
	[self _validateFields];
}

- (void)_clearFields
{
	[_firstNameField setText:@""];
	[_lastNameField setText:@""];
	[_cityField setText:@""];
	[_countryField setText:@""];
	[self _validateFields];
}

- (void)viewDidLoad
{
	[super viewDidLoad];

	[[_locationViewController navigationItem] setHidesBackButton:YES];
	[[_avatarViewController navigationItem] setHidesBackButton:YES];

	NSNotificationCenter *notifier = [NSNotificationCenter defaultCenter];
	[notifier addObserver:self
				 selector:@selector(_nameChanged:)
					 name:UITextFieldTextDidChangeNotification
				   object:_firstNameField];
	[notifier addObserver:self
				 selector:@selector(_nameChanged:)
					 name:UITextFieldTextDidChangeNotification
				   object:_lastNameField];

	[self _clearFields];
}

- (void)viewDidUnload
{
	NSNotificationCenter *notifier = [NSNotificationCenter defaultCenter];
	[notifier removeObserver:self name:UITextFieldTextDidChangeNotification object:_firstNameField];
	[notifier removeObserver:self name:UITextFieldTextDidChangeNotification object:_lastNameField];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[self _clearFields];
}

- (IBAction)showLocationView:(id)sender
{
	[[self navigationController] pushViewController:_locationViewController animated:YES];
}

- (IBAction)showAvatarView:(id)sender
{
	[[self navigationController] pushViewController:_avatarViewController animated:YES];
}

- (IBAction)showPreviousView:(id)sender
{
	[[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)createUser:(id)sender
{
	RDUser *newUser = [[RDStorage sharedStorage] makeUserWithFirstName:[_firstNameField text]
															  lastName:[_lastNameField text]];
	[newUser setCountryName:[_countryField text]];
	[newUser setCityName:[_cityField text]];
	[[self navigationController] popToRootViewControllerAnimated:YES];
}

@end
