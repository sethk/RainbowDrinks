//
//  RDUserSelectionDelegate.h
//  RainbowDrinks
//
//  Created by Seth Anderson Kingsley on 11/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@class RDUser;

@protocol RDUserSelectionDelegate <NSObject>

- (void)controller:(UIViewController *)controller didSelectUser:(RDUser *)user;

@end
