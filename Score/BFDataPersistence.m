//
//  BFDataPersistence.m
//  Score
//
//  Created by Wang Long on 12/24/14.
//  Copyright (c) 2014 Wang Long. All rights reserved.
//

#import "BFDataPersistence.h"

static NSString *ProductsPreferenceFileName = @"products_profile.plist";

@implementation BFDataPersistence

+ (NSString *)preferenceFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"preference.plist"];
}

+ (void)savePreference
{
    NSString *filePath = [[self class] preferenceFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        //saving data
    }
}

+ (NSDictionary *)getUserPassword
{
    return nil;
}

+ (void)saveUserName:(NSString *)userName andPassword:(NSString *)password
{
    
}

+ (NSString *)getFirstLaunchValue
{
    NSString *filePath = [[self class] preferenceFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
        return dict[@"firstLaunch"];
    } else {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        dict[@"firstLaunch"] = @"NO";
        [dict writeToFile:filePath atomically:YES];
        return @"YES";
    }
}

+ (NSString *)getFilePathWithName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *preferenceFilePath = [documentDirectory stringByAppendingPathComponent:fileName];
    
    return preferenceFilePath;
}

+ (NSArray *)getArrayFromPreferenceFile:(NSString *)fileName
{
    NSString *filePath = [self getFilePathWithName:fileName];
    
    NSArray *array;
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        array = [NSArray arrayWithContentsOfFile:filePath];
    } else {
        array = nil;
    }
    return array;
}

+ (NSArray *)loadProductsArray
{
    return [self getArrayFromPreferenceFile:ProductsPreferenceFileName];
}

+ (void)saveProductsPreferenceArray:(NSMutableArray *)array
{
    NSString *filePath = [self getFilePathWithName:ProductsPreferenceFileName];
    [array writeToFile:filePath atomically:YES];
}

@end
