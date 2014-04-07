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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
               Date:(NSString *)date
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.date = date;
        
        NSString *dayStr = [[date componentsSeparatedByString:@"-"] objectAtIndex:2];
        UILabel *l_showDate = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 46, 15)];
        l_showDate.text = [NSString stringWithFormat:@"    %@", dayStr];
        l_showDate.font = [UIFont systemFontOfSize:10];
        l_showDate.textAlignment = NSTextAlignmentLeft;
        l_showDate.backgroundColor = [UIColor colorWithRed:0.83 green:0.83 blue:0.83 alpha:0.5];
        [self addSubview:l_showDate];
        
        UIImageView *seperator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 49, 46, 2)];
        seperator.image = [UIImage imageNamed:@"divider1"];
        [self addSubview:seperator];
  
        
    }

    return self;
}

- (instancetype)initWithBlankContent:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UILabel *l_showDate = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 46, 15)];
        l_showDate.backgroundColor = [UIColor colorWithRed:0.83 green:0.83 blue:0.83 alpha:0.5];
        [self addSubview:l_showDate];
        
        UIImageView *seperator = [[UIImageView alloc] initWithFrame:CGRectMake(0, 49, 46, 2)];
        seperator.image = [UIImage imageNamed:@"divider1"];
        [self addSubview:seperator];
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
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
