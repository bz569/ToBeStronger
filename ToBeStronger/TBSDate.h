//
//  TBSDate.h
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-4-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBSDate : NSObject

+ (NSString *)getWeedDayFromDate:(NSDate *)date;
+ (NSString *)getMonthFromDate:(NSDate *)date;
+ (NSInteger)getMonthValueFromDate:(NSDate *)date;
+ (NSInteger)getYearValueFromDate:(NSDate *)date;
+ (NSInteger)getWeedDayValueFromDate:(NSDate *)date;
+ (NSInteger)getNumberOfDaysInMonth:(NSInteger)month
                               Year:(NSInteger)year;

@end
