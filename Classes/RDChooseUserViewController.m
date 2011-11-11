//
//  RDChooseUserViewController.m
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RDChooseUserViewController.h"
#import "RDStorage.h"
#import "RDUser.h"

@implementation RDChooseUserViewController

- (void)viewWillAppear:(BOOL)isAnimated
{
	[super viewWillAppear:isAnimated];

	_users = [[[RDStorage sharedStorage] usersByLastNameAndFirstName] copy];
}

- (void)viewDidDisappear:(BOOL)isAnimated
{
	[_users release];
	_users = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString * const kReuseIdentifier = @"userCell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
	if (!cell)
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2
                                       reuseIdentifier:kReuseIdentifier] autorelease];

	RDUser *user = [_users objectAtIndex:[indexPath row]];
	[[cell textLabel] setText:[NSString stringWithFormat:@"%@, %@", [user lastName], [user firstName]]];
	return cell;
}

@end
