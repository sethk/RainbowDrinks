//
//  RDAppDelegate.m
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RDAppDelegate.h"

@interface RDAppDelegate ()
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator;
- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;
@end

@implementation RDAppDelegate

#pragma mark -
#pragma mark Initialization

- (void)dealloc
{    
    [_managedObjectContext release];
    [_managedObjectModel release];
    [_persistentStoreCoordinator release];
	[_currentUser release];

	[super dealloc];
}

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveContext];
}

// Probably only relevant for 3.0:
- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
	NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    if (managedObjectContext != nil)
	{
		if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
		{
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}    

#pragma mark -
#pragma mark Core Data stack

- (NSManagedObjectContext *)managedObjectContext
{    
	if (_managedObjectContext != nil)
        return _managedObjectContext;

	NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	if (coordinator != nil)
	{
		_managedObjectContext = [[NSManagedObjectContext alloc] init];
		[_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{    
	if (_managedObjectModel != nil)
		return _managedObjectModel;

	NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"RainbowDrinks" ofType:@"momd"];
	NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
	_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
	return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{    
    if (_persistentStoreCoordinator != nil)
        return _persistentStoreCoordinator;

    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"RainbowDrinks.sqlite"];

	NSError *error = nil;
	_persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
	if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
	{
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}    

	return _persistentStoreCoordinator;
}

#pragma mark -
#pragma mark Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark -
#pragma mark Properties

@synthesize currentUser = _currentUser;

@end

