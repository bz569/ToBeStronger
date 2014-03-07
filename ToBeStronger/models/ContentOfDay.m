//
//  ContentOfDay.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "ContentOfDay.h"

@implementation ContentOfDay

- (instancetype)initWithName:(NSString *)name
                    Position:(NSString *)position
                nubmerPerSet:(NSInteger)numberPerset
                        Sets:(NSInteger)sets
                        Date:(NSString *)date
{
    self = [super initWithName:name
                      Position:position
                  nubmerPerSet:numberPerset
                          Sets:sets];
    
    if(self)
    {
        self.date = date;
        self.finished = NO;
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name
                    Position:(NSString *)position
                nubmerPerSet:(NSInteger)numberPerset
                        Sets:(NSInteger)sets
                        Date:(NSString *)date
                  isFinished:(BOOL)finished
               intervalTimes:(NSMutableArray*)intervalTimes
                   RestTimes:(NSMutableArray*)RestTimes
{
    self = [self initWithName:name
                     Position:position
                 nubmerPerSet:numberPerset
                         Sets:sets
                         Date:date];
    
    if(self)
    {
        self.finished = finished;
        self.intervalTimes = intervalTimes;
        self.restTimes = RestTimes;
    }
    
    return self;
}

- (void)finishPlanWithIntervalTimes:(NSMutableArray *)intervalTimes
                          RestTimes:(NSMutableArray *)restTimes
{
    self.finished = YES;
    self.intervalTimes = intervalTimes;
    self.restTimes =restTimes;
}

@end
