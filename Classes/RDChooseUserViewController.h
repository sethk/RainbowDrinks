//
//  RDChooseUserViewController.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@protocol RDUserSelectionDelegate;

@interface RDChooseUserViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
	IBOutlet id<RDUserSelectionDelegate> _delegate;

	NSArray *_users;
}

@end
