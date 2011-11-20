//
//  RDWelcomeViewController.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RDUserSelectionDelegate.h"

@interface RDWelcomeViewController : UIViewController <RDUserSelectionDelegate>
{
	IBOutlet UIViewController *_newUserViewController;
	IBOutlet UIViewController *_chooseUserViewController;
	IBOutlet UIViewController *_chooseDrinkViewController;
}

- (IBAction)presentNewUser:(id)sender;
- (IBAction)presentChooseUser:(id)sender;

@end
