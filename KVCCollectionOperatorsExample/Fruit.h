//
//  Fruit.h
//  KVCCollectionOperatorsExample
//
//  Created by Tanaka Katsuma on 2014/04/16.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fruit : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, assign, readonly) double price;
@property (nonatomic, strong, readonly) NSDate *boughtAt;

- (instancetype)initWithName:(NSString *)name price:(double)price boughtAt:(NSDate *)boughtAt;

+ (Fruit *)apple;
+ (Fruit *)banana;
+ (Fruit *)orange;
+ (Fruit *)grape;

@end
