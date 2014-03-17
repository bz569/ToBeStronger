//
//  ContentOfDay.h
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercise.h"
#import "TBSDatebase.h"

@interface ContentOfDay : Exercise

@property (strong, nonatomic) NSString *date;
@property (nonatomic, getter = isFinished) BOOL finished;
@property (strong, nonatomic) NSMutableArray *intervalTimes;
@property (strong, nonatomic) NSMutableArray *restTimes;

- (instancetype)initWithName:(NSString *)name
                    Position:(NSString *)position
                nubmerPerSet:(NSInteger)numberPerSet
                        Sets:(NSInteger)sets
                      Weight:(NSInteger)weight
                        Date:(NSString *)date;

- (instancetype)initWithName:(NSString *)name
                    Position:(NSString *)position
                nubmerPerSet:(NSInteger)numberPerSet
                        Sets:(NSInteger)sets
                      Weight:(NSInteger)weight
                        Date:(NSString *)date
                  isFinished:(BOOL)finished
               intervalTimes:(NSMutableArray*)intervalTimes
                   RestTimes:(NSMutableArray*)RestTimes;

- (void)finishPlanWithIntervalTimes:(NSMutableArray*)intervalTimes
                          RestTimes:(NSMutableArray*)restTimes;

- (void)storeIntoDateBase;

@end
