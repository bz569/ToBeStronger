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
@property (weak, nonatomic) IBOutlet UIView *v_calendarBody;
@property (weak, nonatomic) IBOutlet UIView *v_calendarHeader;

//current month
@property (nonatomic) NSInteger month;
@property (nonatomic) NSInteger year;

//date to pass to today view
@property (strong, nonatomic) NSString *selectedDate;

@end

@implementation CalendarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTodayDate];
    [self showCalendar];
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
    
    //set date value
    self.month = [TBSDate getMonthValueFromDate:[NSDate date]];
    self.year = [TBSDate getYearValueFromDate:[NSDate date]];
    
}

- (void)showCalendar
{
    //draw header background
    UIImageView *iv_headerBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    iv_headerBg.image = [UIImage imageNamed:@"bg_calendarHeader"];
    [self.v_calendarHeader addSubview:iv_headerBg];
    [self.v_calendarHeader sendSubviewToBack:iv_headerBg];
    
    //draw seperators above and below calendar header
    UIImageView *septorAboveHeader = [[UIImageView alloc] initWithFrame:CGRectMake(-1, 0, 321, 3)];
    septorAboveHeader.image = [UIImage imageNamed:@"divider1"];
    [self.v_calendarHeader addSubview:septorAboveHeader];
    
    UIImageView *septorBelowHeader = [[UIImageView alloc] initWithFrame:CGRectMake(-1, 36, 321, 5)];
    septorBelowHeader.image = [UIImage imageNamed:@"divider1"];
    [self.v_calendarHeader addSubview:septorBelowHeader];
    
    //draw seperators above and below calendar body
    UIImageView *septorBelowBody = [[UIImageView alloc] initWithFrame:CGRectMake(-1, 248, 321, 5)];
    septorBelowBody.image = [UIImage imageNamed:@"divider1"];
    [self.v_calendarBody addSubview:septorBelowBody];
    
    //Calculate weekday for the first day of month
    NSString *firstDateStr = [NSString stringWithFormat:@"%02ld-%02ld-%02d", (long)self.year, self.month, 1];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *firstDate = [formatter dateFromString:firstDateStr];
    
    NSInteger weekDayOfFirstDay = [TBSDate getWeedDayValueFromDate:firstDate];
    
    //draw calendar
        //set Start column num
    NSInteger cur_column = weekDayOfFirstDay - 1;
    NSInteger cur_row = 0;
    
        //draw blankViews
    for(int i = 0; i < cur_column; i++)
    {
        CalendarDayView *blankView = [[CalendarDayView alloc] initWithBlankContent:CGRectMake(46 * i, 0, 46, 50)];
        [self.v_calendarBody addSubview:blankView];
    }
    
    NSInteger numberOfdays = [TBSDate getNumberOfDaysInMonth:self.month Year:self.year];
    
    for (int i = 6; i > (35 - numberOfdays - cur_column); i--)
    {
        CalendarDayView *blankView = [[CalendarDayView alloc] initWithBlankContent:CGRectMake(46 * i, 200, 46, 50)];
        [self.v_calendarBody addSubview:blankView];
    }
    
    
    for(int i = 1; i <= numberOfdays; i++)
    {
        NSString *dateStr = [NSString stringWithFormat:@"%02ld-%02ld-%02d", self.year, self.month, i];
        CalendarDayView *dayView = [[CalendarDayView alloc] initWithFrame:CGRectMake(46 * cur_column, 50 * cur_row,
                                                                                     46, 50)
                                                                     Date:dateStr
                                                               parentView:self];
        [self.v_calendarBody addSubview:dayView];
        
        cur_row = cur_row + (cur_column+1) / 7;
        cur_column = (cur_column + 1) % 7;
    }

}

- (void)selectDate:(NSString*)date
{
    self.selectedDate = date;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"fuck");
    if([segue.identifier isEqual:@"segue_monthToToday"])
    {
        TodayViewController *todayController = segue.destinationViewController;
        [todayController setValue:self.selectedDate forKey:@"date"];
    }
}


@end
