//
//  Fruit.m
//  KVCCollectionOperatorsExample
//
//  Created by Tanaka Katsuma on 2014/04/16.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "Fruit.h"

@interface Fruit ()

@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, assign, readwrite) double price;
@property (nonatomic, strong, readwrite) NSDate *boughtAt;

@end

@implementation Fruit

- (instancetype)initWithName:(NSString *)name price:(double)price boughtAt:(NSDate *)boughtAt
{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.price = price;
        self.boughtAt = boughtAt;
    }
    
    return self;
}

- (BOOL)isEqual:(id)other
{
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;
    
    if ([self.name isEqualToString:[(Fruit *)other name]])
        return NO;
    
    return YES;
}

- (NSUInteger)hash
{
    return [self.name hash];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p; name = %@; price = %f; boughtAt = %@>",
            NSStringFromClass([self class]),
            self,
            self.name,
            self.price,
            self.boughtAt
            ];
}


#pragma mark - Convenience Constructors

+ (Fruit *)apple
{
    return [[Fruit alloc] initWithName:@"Apple"
                                 price:100.0
                              boughtAt:[self dateFromString:@"2014-04-08 09:00:00 +0900"]];
}

+ (Fruit *)banana
{
    return [[Fruit alloc] initWithName:@"Banana"
                                 price:120.0
                              boughtAt:[self dateFromString:@"2014-03-18 09:00:00 +0900"]];
}

+ (Fruit *)orange
{
    return [[Fruit alloc] initWithName:@"Orange"
                                 price:200.0
                              boughtAt:[self dateFromString:@"2014-03-27 09:00:00 +0900"]];
}

+ (Fruit *)grape
{
    return [[Fruit alloc] initWithName:@"Grape"
                                 price:300.0
                              boughtAt:[self dateFromString:@"2014-04-14 09:00:00 +0900"]];
}


#pragma mark - Formatting Date

+ (NSDate *)dateFromString:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    
    return [formatter dateFromString:string];
}

@end
