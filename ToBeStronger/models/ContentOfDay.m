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
                      Weight:(NSInteger)weight
                        Date:(NSString *)date
              CountingMethod:(NSString *)countingMethod
{
    self = [super initWithName:name
                      Position:position
                  nubmerPerSet:numberPerset
                          Sets:sets
                        Weight:weight
            CountingMethod:countingMethod];
    
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
                      Weight:(NSInteger)weight
                        Date:(NSString *)date
              CountingMethod:(NSString *)countingMethod
                  isFinished:(BOOL)finished
               intervalTimes:(NSMutableArray*)intervalTimes
                   RestTimes:(NSMutableArray*)RestTimes
{
    self = [super initWithName:name
                      Position:position
                  nubmerPerSet:numberPerset
                          Sets:sets
                        Weight:weight
            CountingMethod:countingMethod];

    
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

- (void)storeIntoDateBase
{
    TBSDatebase *db = [[TBSDatebase alloc] init];
    [db insertExerciseContentWithName:self.name
                             Position:self.position
                          NumberOfSet:self.numberPerSet
                                 Sets:self.sets
                               Weight:self.weight
                                 Date:self.date
                             Finished:self.finished];
}

@end
