//
//  RDWelcomeViewController.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface RDWelcomeViewController : UIViewController
{
	IBOutlet UIViewController *_newUserViewController;
	IBOutlet UIViewController *_chooseUserViewController;
}

- (IBAction)newUser:(id)sender;
- (IBAction)chooseUser:(id)sender;

@end
