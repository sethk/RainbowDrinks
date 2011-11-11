//
//  RDStorage.m
//  RainbowDrinks
//
//  Created by Seth Kingsley on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RDStorage.h"
#import "RDAppDelegate.h"
#import "RDUser.h"

static RDStorage *sSharedStorage = nil;

@implementation RDStorage

+ (void)initialize
{
	if (self == [RDStorage class])
	{
		NSManagedObjectContext *managedObjectContext =
				[(RDAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
		NSEntityDescription *storageDescription = [NSEntityDescription entityForName:@"Storage"
															  inManagedObjectContext:managedObjectContext];
		NSFetchRequest *fetchRequest = [[NSFetchRequest new] autorelease];
		[fetchRequest setEntity:storageDescription];
		NSError *error;
		NSArray *objects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
		if (!objects)
		{
			NSLog(@"Could not fetch storage entity: %@", [error localizedDescription]);
			abort();
		}
		else
		{
			NSAssert([objects count] <= 1, @"Too many storage entities in database");
			if ([objects count])
				sSharedStorage = [[objects lastObject] retain];
			else
				sSharedStorage = [[RDStorage alloc] initWithEntity:storageDescription
									insertIntoManagedObjectContext:managedObjectContext];
		}
	}
}

+ (RDStorage *)sharedStorage
{
	return sSharedStorage;
}

-					initWithEntity:(NSEntityDescription *)entity
	insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
	if ((self = [super initWithEntity:entity insertIntoManagedObjectContext:context]))
	{
		_userDescription = [[NSEntityDescription entityForName:@"User" inManagedObjectContext:context] retain];
	}

	return self;
}

- retain
{
	return self;
}

- (NSUInteger)retainCount
{
	return UINT_MAX;
}

- (oneway void)release
{
}

- (void)dealloc
{
	[_userDescription release];

	[super dealloc];
}

@dynamic drinks;
@dynamic users;

- (RDUser *)userWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
	NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest new] autorelease];
	[fetchRequest setIncludesPendingChanges:YES];
	[fetchRequest setEntity:_userDescription];
	[fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"firstName = %@ AND lastName = %@",
			firstName, lastName]];
	NSError *error;
	NSArray *users = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
	if (users)
		return [users lastObject];
	else
	{
		NSLog(@"Could not look up user by firstName and lastName: %@", [error localizedDescription]);
		return nil;
	}
}

- (RDUser *)makeUserWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
	NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
	NSParameterAssert(![self userWithFirstName:firstName lastName:lastName]);
	RDUser *newUser = [[RDUser alloc] initWithEntity:_userDescription
					  insertIntoManagedObjectContext:managedObjectContext];
    [newUser setStorage:self];
	[newUser setFirstName:firstName];
	[newUser setLastName:lastName];
	[self addUsersObject:newUser];
	return newUser;
}

- (NSArray *)usersByLastNameAndFirstName
{
	NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest new] autorelease];
	[fetchRequest setIncludesPendingChanges:YES];
	[fetchRequest setEntity:_userDescription];
	NSSortDescriptor *lastNameSort = [NSSortDescriptor sortDescriptorWithKey:@"lastName" ascending:NO];
	NSSortDescriptor *firstNameSort = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:NO];
	[fetchRequest setSortDescriptors:[NSArray arrayWithObjects:lastNameSort, firstNameSort, nil]];
	NSError *error;
	NSArray *users = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
	if (users)
		return users;
	else
	{
		NSLog(@"Could not fetch sorted users: %@", [error localizedDescription]);
		return nil;
	}
}

@end
