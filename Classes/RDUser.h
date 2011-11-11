//
//  RDUser.h
//  RainbowDrinks
//
//  Created by Seth Kingsley on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class RDStorage;

@interface RDUser : NSManagedObject

@property (nonatomic, retain) RDStorage *storage;
@property (nonatomic, retain) NSString *cityName;
@property (nonatomic, retain) NSString *countryName;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *iconFilename;
@property (nonatomic, retain) NSString *lastName;

@end
