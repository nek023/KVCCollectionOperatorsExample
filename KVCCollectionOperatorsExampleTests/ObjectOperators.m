//
//  ObjectOperators.m
//  KVCCollectionOperatorsExample
//
//  Created by Tanaka Katsuma on 2014/04/16.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Fruit.h"

@interface ObjectOperators : XCTestCase

@property (nonatomic, copy) NSArray *fruits;

@end

@implementation ObjectOperators

- (void)setUp
{
    [super setUp];
    
    self.fruits = @[
                    [Fruit apple],
                    [Fruit apple],
                    [Fruit banana],
                    [Fruit orange],
                    [Fruit grape]
                    ];
    
    /*
     *   Name    Price  Bought At
     *   -------------------------
     *   Apple   100    2014/04/08
     *   Banana  120    2014/03/18
     *   Orange  200    2014/03/27
     *   Grape   300    2014/04/14
     */
}

- (void)testUnionOfObjectsReturnsAnArrayOfTheObjectsInTheSpecifiedProperty
{
    NSArray *actual = [self.fruits valueForKeyPath:@"@unionOfObjects.name"];
    NSArray *expected = @[@"Apple", @"Apple", @"Banana", @"Orange", @"Grape"];
    
    XCTAssertEqualObjects(actual, expected);
}

- (void)testDistinctUnionObjectsReturnsAnArrayOfTheObjectsInTheSpecifiedPropertyWithoutDuplicate
{
    NSArray *actual = [self.fruits valueForKeyPath:@"@distinctUnionOfObjects.name"];
    NSArray *expected = @[@"Apple", @"Banana", @"Orange", @"Grape"];
    
    XCTAssertTrue(actual.count == expected.count);
    
    [expected enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XCTAssertTrue([actual containsObject:obj]);
    }];
}

@end
