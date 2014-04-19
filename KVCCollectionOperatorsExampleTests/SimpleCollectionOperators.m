//
//  SimpleCollectionOperators.m
//  KVCCollectionOperatorsExample
//
//  Created by Tanaka Katsuma on 2014/04/16.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Fruit.h"

@interface SimpleCollectionOperators : XCTestCase

@property (nonatomic, copy) NSArray *basket;

@end

@implementation SimpleCollectionOperators

- (void)setUp
{
    [super setUp];
    
    self.basket = @[
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

- (void)testCountReturnsTheNumberOfValues
{
    NSNumber *count = [self.basket valueForKeyPath:@"@count"];
    XCTAssertEqualObjects(count, @(4));
}

- (void)testSumReturnsTheSumOfValues
{
    NSNumber *totalPrice = [self.basket valueForKeyPath:@"@sum.price"];
    XCTAssertEqualObjects(totalPrice, @(720));
}

- (void)testAvgReturnsTheAverageValue
{
    NSNumber *averagePrice = [self.basket valueForKeyPath:@"@avg.price"];
    XCTAssertEqualObjects(averagePrice, @(180));
    
    NSNumber *averageLengthOfName = [self.basket valueForKeyPath:@"@avg.name.length"];
    XCTAssertEqualObjects(averageLengthOfName, @(5.5));
}

- (void)testMaxReturnsTheMaximumValueInTheCollection
{
    NSNumber *maximumPrice = [self.basket valueForKeyPath:@"@max.price"];
    XCTAssertEqualObjects(maximumPrice, @(300));
    
    NSDate *latestDate = [self.basket valueForKeyPath:@"@max.boughtAt"];
    XCTAssertEqualObjects(latestDate, [[Fruit grape] boughtAt]);
}

- (void)testMinReturnsTheMinimumValueInTheCollection
{
    NSNumber *minimumPrice = [self.basket valueForKeyPath:@"@min.price"];
    XCTAssertEqualObjects(minimumPrice, @(100));
}

- (void)testSelfKeyPathCanBeUsedToOperateValueOfItsObjects
{
    NSArray *prices = @[ @(100), @(120), @(200), @(300) ];
    
    NSNumber *averagePrice = [prices valueForKeyPath:@"@avg.self"];
    XCTAssertEqualObjects(averagePrice, @(180));
    
    NSNumber *maxValue = [prices valueForKeyPath:@"@max.self"];
    XCTAssertEqualObjects(maxValue, @(300));
}

@end
