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

@interface CalendarDayView : UIView
- (id)initWithFrame:(CGRect)frame Date:(NSString *)date;
- (instancetype)initWithBlankContent:(CGRect)frame;

@end
