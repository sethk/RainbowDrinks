    //
//  RDWelcomeViewController.m
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RDWelcomeViewController.h"
#import "RDAppDelegate.h"

@implementation RDWelcomeViewController

- (void)viewWillAppear:(BOOL)animated
{
	[(RDAppDelegate *)[[UIApplication sharedApplication] delegate] setCurrentUser:nil];
	[super viewWillAppear:animated];
}

- (IBAction)presentNewUser:(id)sender
{
	[_newUserViewController setHidesBottomBarWhenPushed:YES];
	[[self navigationController] pushViewController:_newUserViewController animated:YES];
}

- (IBAction)presentChooseUser:(id)sender
{
	[[self navigationController] pushViewController:_chooseUserViewController animated:YES];
}

#pragma mark -
#pragma mark User Selection Delegate

- (void)controller:(UIViewController *)controller didSelectUser:(id)user
{
	UINavigationController *navigationController = [self navigationController];
	[navigationController popToViewController:self animated:NO];
	[navigationController pushViewController:_chooseDrinkViewController animated:NO];
}

@end
