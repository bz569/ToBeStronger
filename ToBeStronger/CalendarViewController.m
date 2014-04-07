//
//  CalendarViewController.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-4-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

//used to show info
@property (weak, nonatomic) IBOutlet UILabel *l_showDate;
@property (weak, nonatomic) IBOutlet UILabel *l_showWeekDay;
@property (weak, nonatomic) IBOutlet UILabel *l_showMonth;

//current month
@property (nonatomic) NSInteger month;


@end

@implementation CalendarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTodayDate];
}

- (void)setTodayDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    
    //set UILable to show date
    self.l_showDate.text = [NSString stringWithFormat:@"%d", [[[date componentsSeparatedByString:@"-"] objectAtIndex:2] intValue]];
    self.l_showWeekDay.text = [TBSDate getWeedDayFromDate:[NSDate date]];
    self.l_showMonth.text = [TBSDate getMonthFromDate:[NSDate date]];
    
    //set month value
    self.month = [TBSDate getMonthValueFromDate:[NSDate date]];
}



@end
