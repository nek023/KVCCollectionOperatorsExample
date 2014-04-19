//
//  BasicsOfKeyValueCoding.m
//  KVCCollectionOperatorsExample
//
//  Created by Tanaka Katsuma on 2014/04/16.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Fruit.h"

@interface BasicsOfKeyValueCoding : XCTestCase

@end

@implementation BasicsOfKeyValueCoding

- (void)testValueForKeyToAccessToTheProperties
{
    /*
     *   Fruit
     *
     *   @property NSString * name;
     *   @property double     price;
     *   @property NSDate   * boughtAt;
     */
    
    /*
     *   Name    Price  Bought At
     *   -------------------------
     *   Apple   100    2014/04/08
     *   Banana  120    2014/03/18
     *   Orange  200    2014/03/27
     *   Grape   300    2014/04/14
     */
    
    Fruit *apple = [Fruit apple];
    
    NSString *name = [apple valueForKey:@"name"];
    XCTAssertEqualObjects(name, @"Apple");
    
    id price = [apple valueForKey:@"price"];
    XCTAssertTrue([price isKindOfClass:[NSNumber class]]);
    XCTAssertEqualObjects(price, @(100));
}

- (void)testValueForKeyPathToAccessToTheSecondLevelProperties
{
    Fruit *banana = [Fruit banana];
    
    NSNumber *lengthOfName = [banana valueForKeyPath:@"name.length"];
    XCTAssertEqualObjects(lengthOfName, @(6));
}

- (void)testKeyPathToReturnItself
{
    NSString *string = [@"Banana" valueForKeyPath:@"self"];
    XCTAssertEqualObjects(string, @"Banana");
}

- (void)testAccessingToDictionaryByUsingKVC
{
    NSDictionary *status = @{
                             @"text": @"Hi, friends!",
                             @"user": @{
                                     @"screen_name": @"questbeat"
                                     }
                             };
    
    NSString *text = [status valueForKey:@"text"];
    XCTAssertEqualObjects(text, @"Hi, friends!");
    
    NSString *screen_name = [status valueForKeyPath:@"user.screen_name"];
    XCTAssertEqualObjects(screen_name, @"questbeat");
}

@end
