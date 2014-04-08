//
//  CalendarDayView.h
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-4-4.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentOfDay.h"
#import "TBSDatabase.h"
#import "CalendarViewController.h"

@interface CalendarDayView : UIView
- (instancetype)initWithFrame:(CGRect)frame
                         Date:(NSString *)date
                   parentView:(UIViewController *)parentView;

- (instancetype)initForTodayWithFrame:(CGRect)frame
                                 Date:(NSString *)date
                           parentView:(UIViewController *)parentView;

- (instancetype)initWithBlankContent:(CGRect)frame;

@end
