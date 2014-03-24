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

@end

@implementation CounterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //new a ContentOfDay object for test
    self.exerciseContent = [[ContentOfDay alloc] initWithID:1
                                                       Name:@"Pushups"
                                                   Position:@"Chest"
                                               nubmerPerSet:12
                                                       Sets:4
                                                     Weight:0
                                                       Date:@"2014-3-24"
                                             CountingMethod:@"Touch"
                                                 isFinished:NO];

    //initial view
    
    self.setNumber = 1;
    self.l_setNumber.text = [NSString stringWithFormat:@"Set %ld", self.setNumber];
    
    self.l_countingMethod.text = [NSString stringWithFormat:@"CountingMethod: %@", self.exerciseContent.countingMethod];
    
    self.l_currentNumber.font = [UIFont fontWithName:@"Farrington-7B-Qiqi" size:70];
    self.l_currentNumber.text = [NSString stringWithFormat:@"00"];
    
    self.l_planedNumber.font = [UIFont fontWithName:@"Farrington-7B-Qiqi" size:70];
    self.l_planedNumber.text = [NSString stringWithFormat:@"%ld", self.exerciseContent.numberPerSet];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.exerciseContent.countingMethod == @"Touch");
    {
        self.curNumber++;
        
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
