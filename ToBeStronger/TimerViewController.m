//
//  TimerViewController.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-7.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lable_showTime;
@property (nonatomic) NSInteger timeInt;
@property (strong, nonatomic) NSTimer *mTimer;
@end

@implementation TimerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.timeInt = 0;
    self.mTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(updateTime)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)updateTime
{
    self.timeInt += 1;
    int time_sec = self.timeInt - (60 * (int)(self.timeInt / 60));
    int time_min = (int)self.timeInt / 60;
    NSString *timeStr = [NSString stringWithFormat:@"%02d:%02d", time_min, time_sec];
    
    [self.lable_showTime setText:timeStr];
   
}


@end
