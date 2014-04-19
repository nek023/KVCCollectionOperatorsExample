//
//  ArrayAndSetOperators.m
//  KVCCollectionOperatorsExample
//
//  Created by Tanaka Katsuma on 2014/04/17.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Fruit.h"

@interface ArrayAndSetOperators : XCTestCase

@property (nonatomic, copy) NSArray *fruits;

@end

@implementation ArrayAndSetOperators

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

- (void)testUnionOfArraysReturnsAnArrayContainingTheCombinedValuesOfEachArray
{
    NSArray *hogeStoreInventory = @[
                                    [Fruit apple],
                                    [Fruit banana]
                                    ];
    NSArray *piyoStoreInventory = @[
                                    [Fruit apple],
                                    [Fruit orange]
                                    ];
    
    NSArray *actual = [@[hogeStoreInventory, piyoStoreInventory] valueForKeyPath:@"@unionOfArrays.name"];
    NSArray *expected = @[@"Apple", @"Banana", @"Apple", @"Orange"];
    
    XCTAssertTrue([actual isKindOfClass:[NSArray class]]);
    XCTAssertEqualObjects(actual, expected);
}

- (void)testDistinctUnionOfArraysReturnsAnArrayContainingTheCombinedValuesOfEachArrayWithoutDuplicate
{
    NSArray *hogeStoreInventory = @[
                                    [Fruit apple],
                                    [Fruit banana]
                                    ];
    NSArray *piyoStoreInventory = @[
                                    [Fruit apple],
                                    [Fruit orange]
                                    ];
    
    NSArray *actual = [@[hogeStoreInventory, piyoStoreInventory] valueForKeyPath:@"@distinctUnionOfArrays.name"];
    NSArray *expected = @[@"Apple", @"Banana", @"Orange"];
    
    XCTAssertTrue([actual isKindOfClass:[NSArray class]]);
    XCTAssertTrue(actual.count == expected.count);
    
    [expected enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XCTAssertTrue([actual containsObject:obj]);
    }];
}

- (void)testDistinctUnionOfSetsReturnsAnArrayContainingTheCombinedValuesOfEachSetWithoutDuplicate
{
    NSSet *hogeStoreInventory = [NSSet setWithArray:@[
                                                      [Fruit apple],
                                                      [Fruit banana]
                                                      ]];
    NSSet *piyoStoreInventory = [NSSet setWithArray:@[
                                                      [Fruit apple],
                                                      [Fruit orange]
                                                      ]];
    NSSet *inventories = [NSSet setWithArray:@[hogeStoreInventory, piyoStoreInventory]];
    
    NSSet *actual = [inventories valueForKeyPath:@"@distinctUnionOfSets.name"];
    NSSet *expected = [NSSet setWithArray:@[@"Apple", @"Banana", @"Orange"]];
    
    XCTAssertTrue([actual isKindOfClass:[NSSet class]]);
    XCTAssertEqualObjects(actual, expected);
}

@end
