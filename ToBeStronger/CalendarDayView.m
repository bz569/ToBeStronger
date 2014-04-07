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
        
        [self addContentIcons];
  
        
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

- (void)addContentIcons
{
    TBSDatabase *db = [[TBSDatabase alloc] init];
    NSArray *contents = [db getContentsOfDayByDate:self.date];
    
    NSMutableArray *positions = [[NSMutableArray alloc] init];
    for(ContentOfDay *content in contents)
    {
        if(![positions containsObject:content.position])
        {
            [positions addObject:content.position];
        }
    }
    
    switch ([positions count])
    {
        case 0:
            break;
        case 1:
        {
            UILabel *iconview = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 15, 15)];
            iconview.text = [self getIconForPosition:[positions objectAtIndex:0]];
            iconview.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview];
            break;
        }
        case 2:
        {
            UILabel *iconview1 = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 15, 15)];
            iconview1.text = [self getIconForPosition:[positions objectAtIndex:0]];
            iconview1.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview1];
            UILabel *iconview2 = [[UILabel alloc] initWithFrame:CGRectMake(27, 17, 15, 15)];
            iconview2.text = [self getIconForPosition:[positions objectAtIndex:1]];
            iconview2.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview2];
            break;
        }
        case 3:
        {
            UILabel *iconview1 = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 15, 15)];
            iconview1.text = [self getIconForPosition:[positions objectAtIndex:0]];
            iconview1.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview1];
            UILabel *iconview2 = [[UILabel alloc] initWithFrame:CGRectMake(27, 17, 15, 15)];
            iconview2.text = [self getIconForPosition:[positions objectAtIndex:1]];
            iconview2.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview2];
            UILabel *iconview3 = [[UILabel alloc] initWithFrame:CGRectMake(12, 33, 15, 15)];
            iconview3.text = [self getIconForPosition:[positions objectAtIndex:2]];
            iconview3.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview3];
            break;
        }
        case 4:
        {
            UILabel *iconview1 = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 15, 15)];
            iconview1.text = [self getIconForPosition:[positions objectAtIndex:0]];
            iconview1.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview1];
            UILabel *iconview2 = [[UILabel alloc] initWithFrame:CGRectMake(27, 17, 15, 15)];
            iconview2.text = [self getIconForPosition:[positions objectAtIndex:1]];
            iconview2.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview2];
            UILabel *iconview3 = [[UILabel alloc] initWithFrame:CGRectMake(12, 33, 15, 15)];
            iconview3.text = [self getIconForPosition:[positions objectAtIndex:2]];
            iconview3.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview3];
            UILabel *iconview4 = [[UILabel alloc] initWithFrame:CGRectMake(27, 17, 15, 15)];
            iconview4.text = [self getIconForPosition:[positions objectAtIndex:3]];
            iconview4.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview4];
            break;
        }
        default:
        {
            UILabel *iconview1 = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 15, 15)];
            iconview1.text = [self getIconForPosition:[positions objectAtIndex:0]];
            iconview1.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview1];
            UILabel *iconview2 = [[UILabel alloc] initWithFrame:CGRectMake(27, 17, 15, 15)];
            iconview2.text = [self getIconForPosition:[positions objectAtIndex:1]];
            iconview2.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview2];
            UILabel *iconview3 = [[UILabel alloc] initWithFrame:CGRectMake(12, 33, 15, 15)];
            iconview3.text = [self getIconForPosition:[positions objectAtIndex:2]];
            iconview3.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview3];
            UILabel *iconview4 = [[UILabel alloc] initWithFrame:CGRectMake(27, 17, 15, 15)];
            iconview4.text = @"...";
            iconview4.font = [UIFont systemFontOfSize:8];
            [self addSubview:iconview4];
            break;
        }
    }
    
    
    
    
}


//need modify
- (NSString*)getIconForPosition:(NSString *)position
{
    if([position isEqual:@"Shoulders"])
    {
        return @"S";
    }else if([position isEqual:@"Chest"])
    {
        return @"C";
    }
    else if([position isEqual:@"Arms"])
    {
        return @"A";
    }else if([position isEqual:@"Core"])
    {
        return @"Co";
    }else if([position isEqual:@"Legs"])
    {
        return @"L";
    }else if([position isEqual:@"Other"])
    {
        return @"O";
    }else
    {
        return @"error";
    }
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
