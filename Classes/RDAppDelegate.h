//
//  RDAppDelegate.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface RDAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *_window;

@private
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
}

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;

@end

