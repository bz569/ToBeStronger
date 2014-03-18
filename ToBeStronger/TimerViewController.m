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
@property (weak, nonatomic) IBOutlet UIImageView *timerimage;
@property (strong, nonatomic) TimerPics *timerPics;
@property (strong, nonatomic) AVAudioPlayer *clockSoundPlayer;

@property (strong, nonatomic) TBSDatebase *db;

@end

@implementation TimerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.timerPics = [[TimerPics alloc] init];
    
    self.timeInt = 0;
    self.mTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(updateTime)
                                            userInfo:nil
                                             repeats:YES];
    
    [self initClockSoundPlayer];
    if(self.clockSoundPlayer)
    {
        [self.clockSoundPlayer play];
    }
    
    self.db = [[TBSDatebase alloc] init];
    [self.db insertExerciseContentWithName:@"Push-ups"
                                  Position:@"Chest"
                               NumberOfSet:12
                                      Sets:4
                                    Weight:40
                                      Date:@"2014-3-12"
                            CountingMethod:@"Accelormeter"];
    
}

- (void)initClockSoundPlayer
{
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"clock" ofType:@"mp3"];
    if(soundPath)
    {
        self.clockSoundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:soundPath]
                                                                   error:nil];
        
        [self.clockSoundPlayer prepareToPlay];
        [self.clockSoundPlayer setNumberOfLoops:-1];
        [self.clockSoundPlayer setVolume:1];
    }
}

- (void)updateTime
{
    self.timeInt += 1;
    int time_sec = self.timeInt - (60 * (int)(self.timeInt / 60));
    int time_min = (int)self.timeInt / 60;
    NSString *timeStr = [NSString stringWithFormat:@"%02d:%02d", time_min, time_sec];
    
    [self.lable_showTime setText:timeStr];
    
    [self.timerimage setImage:[self.timerPics getTimerImage:time_sec]];
}


@end
