//
//  BFDataPersistence.h
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFDataPersistence : NSObject

+ (NSString *)getFirstLaunchValue;

+ (void)saveUserName:(NSString *)userName andPassword:(NSString *)password;
+ (NSDictionary *)getUserPassword;

+ (NSArray *)loadProductsArray;
+ (void)saveProductsPreferenceArray:(NSMutableArray *)array;

@end
