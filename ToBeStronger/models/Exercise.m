//
//  Exercises.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

- (instancetype)initWithName:(NSString *)name
                    Position:(NSString *)position
                nubmerPerSet:(NSInteger)numberPerset
                        Sets:(NSInteger)sets
{
    self = [super init];
    
    if(self)
    {
        self.name = name;
        self.position = position;
        self.numberPerSet = numberPerset;
        self.sets = sets;
    }
    
    return self;
}


@end
