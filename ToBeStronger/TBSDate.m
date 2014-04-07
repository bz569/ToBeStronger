//
//  TBSDate.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-4-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "TBSDate.h"

@interface TBSDate ()

@end

@implementation TBSDate

+ (NSString *)getWeedDayFromDate:(NSDate *)date
{
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSWeekdayCalendarUnit
                                                                              fromDate:date];
    
    NSInteger weekday = [componets weekday];
    
    switch (weekday)
    {
        case 1:
            return @"Sunday";
            break;
            
        case 2:
            return @"Monday";
            break;
            
        case 3:
            return @"Tuesday";
            break;
            
        case 4:
            return @"Wednesday";
            break;
            
        case 5:
            return @"Thursday";
            break;
            
        case 6:
            return @"Friday";
            break;
            
        case 7:
            return @"Saturday";
            break;
            
        default:
            return @"Error";
            break;
    }
    
    
}

+ (NSInteger)getMonthValueFromDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *component = [calendar components:unitFlags fromDate:date];
    NSInteger month = [component month];
    
    return month;
}

+ (NSString *)getMonthFromDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *component = [calendar components:unitFlags fromDate:date];
    NSInteger month = [component month];
    NSLog(@"month=%ld", month);
    
    switch (month)
    {
        case 1:
            return @"January";
            break;
            
        case 2:
            return @"Feburary";
            break;
            
        case 3:
            return @"March";
            break;
            
        case 4:
            return @"April";
            break;
            
        case 5:
            return @"May";
            break;
            
        case 6:
            return @"June";
            break;
            
        case 7:
            return @"July";
            break;
            
        case 8:
            return @"August";
            break;
            
        case 9:
            return @"September";
            break;
            
        case 10:
            return @"Octorber";
            break;
            
        case 11:
            return @"November";
            break;
            
        case 12:
            return @"December";
            break;
            
        default:
            return @"Error";
            break;
    }
    
    
}



@end
