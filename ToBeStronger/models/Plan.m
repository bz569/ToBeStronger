//
//  Plan.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "Plan.h"

@implementation Plan

- (instancetype)initWithPlanName:(NSString *)name
                        Position:(NSString *)position
                       StartDate:(NSString *)startDate
                       Frequency:(NSInteger)frequency
                       NumPerSet:(NSInteger)numberPerSet
                            Sets:(NSInteger)sets
                          Weight:(NSInteger)weight
                        Duration:(NSInteger)duration
                  CountingMethod:(NSString*)countingMethod
              isNeedNotification:(BOOL)needNotification
{
    self = [super initWithName:name
                      Position:position
                  nubmerPerSet:numberPerSet
                          Sets:sets
                        Weight:weight
            CountingMethod:countingMethod];
    
    if(self)
    {
        self.startDate = startDate;
        self.frequency = frequency;
        self.duration = duration;
        self.needNotification = needNotification;
    }
    
    return self;
}

- (NSMutableArray *)generatePlan
{
    NSMutableArray *planContent = [[NSMutableArray alloc] init];
    
    NSInteger numOfDays = (self.duration * 7 + self.frequency - 1) / self.frequency;
    
    for(int i = 0; i < numOfDays; i++)
    {
        ContentOfDay *newContent = [[ContentOfDay alloc] initWithName:self.name
                                                      Position:self.position
                                                  nubmerPerSet:self.numberPerSet
                                                          Sets:self.numberPerSet
                                                               Weight:self.weight
                                                       CountingMethod:self.countingMethod];
        
        [planContent addObject:newContent];
    }
    
    return planContent;
}


//to calculate the next exercise day by current Date and frequency
- (NSString*)nextExerciseDayByCurrentDate:(NSString*)currentDate
                                Frequency:(NSInteger)frequency
{
    NSString *nextDay = [[NSString alloc] init];
    NSArray *dateAry = [currentDate componentsSeparatedByString:@"-"];
    
    if(dateAry)
    {
        NSInteger currentYear = [dateAry[0] integerValue];
        NSInteger currentMonth = [dateAry[1] integerValue];
        NSInteger currentDay = [dateAry[2] integerValue];
        
        if((currentMonth == 1) || (currentMonth == 3) || (currentMonth == 5) || (currentMonth == 7)
           || (currentMonth == 8) || (currentMonth == 10))                          //Jan, Mar, May, July, Aug, Oct
        {
            if(currentDay == 31)
            {
                currentDay = 1;
                currentMonth++;
            }
            else
            {
                currentDay++;
            }
            
        }else if((currentMonth == 4) || (currentMonth == 6) || (currentMonth == 9) || (currentMonth == 11))     //Apr, June, Sep, Nov
        {
            if(currentDay == 30)
            {
                currentDay = 1;
                currentMonth++;
            }
            else
            {
                currentDay++;
            }
        }else if(currentMonth == 2)     //Feb
        {
            if(([self isLeapYear:currentYear] && currentDay == 29) || (([self isLeapYear:currentDay] == NO) && currentDay == 28))  // the last of Feb
            {
                currentDay = 1;
                currentMonth++;
            }else
            {
                currentDay++;
            }
        }else if(currentMonth == 12)    //Dec
        {
            if(currentDay == 31)
            {
                currentDay = 1;
                currentMonth++;
                currentYear++;
            }
            else
            {
                currentDay++;
            }
        }
        
        nextDay = [NSString stringWithFormat:@"%ld-%d-%d", currentYear, currentMonth, currentDay];
        
    }
    
    return nextDay;
    
}

- (BOOL)isLeapYear:(NSInteger)year
{
    if ((year % 4  == 0 && year % 100 != 0) || (year % 400 == 0))
        return YES;
    else
        return NO;
    
}





@end
