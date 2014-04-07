//
//  CalendarDayView.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-4-4.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "CalendarDayView.h"

@interface CalendarDayView()

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSArray *contents;


@end

@implementation CalendarDayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
               Date:(NSString *)date
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.date = date;
        
        NSString *dayStr = [[date componentsSeparatedByString:@"-"] objectAtIndex:2];
        UILabel *l_showDate = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320/7, 15)];
        l_showDate.text = dayStr;
        l_showDate.font = [UIFont systemFontOfSize:5];
        l_showDate.textAlignment = NSTextAlignmentLeft;
        [self addSubview:l_showDate];
  
        
    }

    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
