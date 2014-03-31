//
//  CounterViewController.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-24.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *l_currentNumber;
@property (weak, nonatomic) IBOutlet UILabel *l_planedNumber;
@property (weak, nonatomic) IBOutlet UILabel *l_setNumber;
@property (weak, nonatomic) IBOutlet UILabel *l_countingMethod;

@property (strong, nonatomic) ContentOfDay *exerciseContent;
@property (nonatomic) NSInteger setNumber;
@property (nonatomic) NSInteger curNumber;

//used for counting by Accelorometer
@property (strong, nonatomic) NSMutableArray *fiveRecords;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation CounterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"msg rec:%@", self.exerciseContent.name);
    
//    //new a ContentOfDay object for test
//    self.exerciseContent = [[ContentOfDay alloc] initWithID:1
//                                                       Name:@"Pushups"
//                                                   Position:@"Chest"
//                                               nubmerPerSet:12
//                                                       Sets:4
//                                                     Weight:0
//                                                       Date:@"2014-3-24"
//                                             CountingMethod:@"Accelorometer"
//                                                 isFinished:NO];

    //initial view
    
    self.setNumber = 1;
    self.l_setNumber.text = [NSString stringWithFormat:@"Set %ld", self.setNumber];
    
    self.l_countingMethod.text = [NSString stringWithFormat:@"CountingMethod: %@", self.exerciseContent.countingMethod];
    
    self.l_currentNumber.font = [UIFont fontWithName:@"Farrington-7B-Qiqi" size:70];
    self.l_currentNumber.text = [NSString stringWithFormat:@"00"];
    
    self.l_planedNumber.font = [UIFont fontWithName:@"Farrington-7B-Qiqi" size:70];
    self.l_planedNumber.text = [NSString stringWithFormat:@"%ld", self.exerciseContent.numberPerSet];
    
    if([self.exerciseContent.countingMethod  isEqual: @"Accelorometer"])
    {
        [self startCountingByAccelorometer];
    }
    
}

- (void)startCountingByAccelorometer
{
    self.motionManager = [[CMMotionManager alloc] init];
    self.queue = [[NSOperationQueue alloc] init];
    self.fiveRecords = [[NSMutableArray alloc] init];
    CMDeviceMotion *motion = self.motionManager.deviceMotion;
    
    if(self.motionManager.deviceMotionAvailable)
    {
        self.motionManager.deviceMotionUpdateInterval = 1.0 / 60.0;
        
        [self.motionManager startDeviceMotionUpdatesToQueue:self.queue
                                                withHandler:^(CMDeviceMotion *motion, NSError *error)
        {
            NSInteger x = motion.userAcceleration.x;
            NSInteger y = motion.userAcceleration.y;
            NSInteger z = motion.userAcceleration.z;
            
            NSNumber *sum = [NSNumber numberWithDouble:sqrt(x*x + y*y + z*z)];
            
            if([self.fiveRecords count] < 5)
            {
                [self.fiveRecords addObject:sum];
            }else
            {
                [self.fiveRecords removeObjectAtIndex:0];
                [self.fiveRecords addObject:sum];
                
                
                double n1 = [[self.fiveRecords objectAtIndex:0] doubleValue];
                double n2 = [[self.fiveRecords objectAtIndex:1] doubleValue];
                double n3 = [[self.fiveRecords objectAtIndex:2] doubleValue];
                double n4 = [[self.fiveRecords objectAtIndex:3] doubleValue];
                double n5 = [[self.fiveRecords objectAtIndex:4] doubleValue];
                
                if((n2 > n1) && (n3 > n2) && (n4 < n3) && (n5 < n4))
                {
                    self.curNumber++;
                    NSLog(@"count=%d", self.curNumber);
                    
                    [self performSelectorOnMainThread:@selector(changeCountingNum) withObject:nil waitUntilDone:NO];
                }
            }
        }];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([self.exerciseContent.countingMethod  isEqual:@"Touch"])
    {
        self.curNumber++;
        [self performSelectorOnMainThread:@selector(changeCountingNum) withObject:nil waitUntilDone:NO];
       
    }
    
}

- (void)changeCountingNum
{
    if(self.curNumber < self.exerciseContent.numberPerSet)
    {
        self.l_currentNumber.text = [NSString stringWithFormat:@"%02ld", self.curNumber];
    }else
    {
        self.l_currentNumber.text = [NSString stringWithFormat:@"%02ld", self.curNumber];
        
        self.setNumber++;
        if(self.setNumber <= self.exerciseContent.sets)
        {
            [self performSegueWithIdentifier:@"segue_CounterToTimer" sender:self];
            self.l_setNumber.text = [NSString stringWithFormat:@"Set %ld", self.setNumber];
        }else
        {
            NSLog(@"Set Finished");
        }
        self.curNumber = 0;
        self.l_currentNumber.text = [NSString stringWithFormat:@"%02ld", self.curNumber];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
