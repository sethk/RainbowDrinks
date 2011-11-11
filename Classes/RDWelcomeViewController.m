    //
//  RDWelcomeViewController.m
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RDWelcomeViewController.h"


@implementation RDWelcomeViewController

- (IBAction)newUser:(id)sender
{
	[_newUserViewController setHidesBottomBarWhenPushed:YES];
	[[self navigationController] pushViewController:_newUserViewController animated:YES];
}

- (IBAction)chooseUser:(id)sender
{
	[[self navigationController] pushViewController:_chooseUserViewController animated:YES];
}

@end
