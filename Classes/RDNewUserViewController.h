//
//  RDNewUserViewController.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDNewUserViewController : UIViewController
{
	IBOutlet UIViewController *_locationViewController;
	IBOutlet UIViewController *_avatarViewController;
}

- (IBAction)showLocationView:(id)sender;
- (IBAction)showAvatarView:(id)sender;
- (IBAction)showPreviousView:(id)sender;
- (IBAction)createUser:(id)sender;

@end
