//
//  Exercises.h
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exercise : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *position;
@property (nonatomic) NSInteger numberPerSet;
@property (nonatomic) NSInteger sets;

- (instancetype) initWithName:(NSString *)name
                     Position:(NSString *)position
                 nubmerPerSet:(NSInteger)numberPerset
                         Sets:(NSInteger) sets;

@end

