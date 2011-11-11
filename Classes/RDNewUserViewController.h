//
//  RDNewUserViewController.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface RDNewUserViewController : UIViewController
{
	IBOutlet UITextField *_firstNameField;
	IBOutlet UITextField *_lastNameField;
	IBOutlet UILabel *_nameErrorLabel;
	IBOutlet UIButton *_showLocationButton;
	IBOutlet UITextField *_countryField;
	IBOutlet UITextField *_cityField;
	IBOutlet UIViewController *_locationViewController;
	IBOutlet UIViewController *_avatarViewController;
}

- (IBAction)showLocationView:(id)sender;
- (IBAction)showAvatarView:(id)sender;
- (IBAction)showPreviousView:(id)sender;
- (IBAction)createUser:(id)sender;

@end
