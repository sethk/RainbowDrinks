//
//  RDStorage.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class RDUser;
@class RDDrink;

@interface RDStorage : NSManagedObject
{
	NSEntityDescription *_userDescription;
}

+ (RDStorage *)sharedStorage;

@property (nonatomic, retain) NSSet *drinks;
@property (nonatomic, retain) NSSet *users;

- (RDUser *)userWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
- (RDUser *)makeUserWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
- (NSArray *)usersByLastNameAndFirstName;

@end

// coalesce these into one @interface RDStorage (CoreDataGeneratedAccessors) section
@interface RDStorage (CoreDataGeneratedAccessors)
- (void)addDrinksObject:(RDDrink *)value;
- (void)removeDrinksObject:(RDDrink *)value;
- (void)addDrinks:(NSSet *)value;
- (void)removeDrinks:(NSSet *)value;

- (void)addUsersObject:(RDUser *)value;
- (void)removeUsersObject:(RDUser *)value;
- (void)addUsers:(NSSet *)value;
- (void)removeUsers:(NSSet *)value;
@end
