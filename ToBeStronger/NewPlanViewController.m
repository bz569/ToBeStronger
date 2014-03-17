//
//  NewPlanViewController.m
//  ToBeStronger
//
//  Created by Zhang Boxuan on 14-3-12.
//  Copyright (c) 2014年 Boxuan Zhang. All rights reserved.
//

#import "NewPlanViewController.h"

@interface NewPlanViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tf_position;
@property (weak, nonatomic) IBOutlet UITextField *tf_content;
@property (weak, nonatomic) IBOutlet UITextField *tf_sets;
@property (weak, nonatomic) IBOutlet UITextField *tf_numPerSet;
@property (weak, nonatomic) IBOutlet UITextField *tf_weight;
@property (weak, nonatomic) IBOutlet UITextField *tf_startDate;
@property (weak, nonatomic) IBOutlet UITextField *tf_frequency;
@property (weak, nonatomic) IBOutlet UITextField *tf_countingMethod;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker_startDate;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView_frequency;
@property (strong, nonatomic) IBOutlet UIToolbar *doneToolBar_datePicker;

@property (strong, nonatomic) NSString *planDate;

@end

@implementation NewPlanViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setTextfields];
    [self createDatePicker];
    
    }

- (void)setTextfields
{
    self.tf_weight.delegate = self;
    self.tf_weight.clearsOnBeginEditing = YES;
}

//using UIPickerView to input frequency
- (void)createPickerViewForFrequencyInput
{
    self.tf_frequency.delegate = self;
    
    //Create UIPickerView
    self.pickerView_frequency = [[UIPickerView alloc] init];
    
    
}

//using UIDatePicker to input start date
- (void)createDatePicker
{
    self.tf_startDate.delegate = self;
    
    //Create UIDatePicker
    self.datePicker_startDate = [[UIDatePicker alloc] init];
    self.datePicker_startDate.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    self.datePicker_startDate.datePickerMode = UIDatePickerModeDate;
    
    //Set tv_startDate's inputview to UIDatePicker
    self.tf_startDate.inputView = self.datePicker_startDate;
    
    //create UIToolBar
    self.doneToolBar_datePicker = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    // add done button
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self
                                                                           action:@selector(donePicker)];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:self
                                                                           action:nil];
    self.doneToolBar_datePicker.items = [NSArray arrayWithObjects:space, right, nil];
    //Set tf_startDate's inputAccessoryView to doneToolBar
    self.tf_startDate.inputAccessoryView = self.doneToolBar_datePicker;
}

- (void)donePicker
{
    if ([self.view endEditing:NO]) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-MM-DD"];
        self.tf_startDate.text = [NSString stringWithFormat:@"Start Date\t\t\t\t\t\t%@",[formatter stringFromDate:self.datePicker_startDate.date]];
        self.planDate = [NSString stringWithString:[formatter stringFromDate:self.datePicker_startDate.date]];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == self.tf_weight)
    {
        NSString *tmp = [NSString stringWithString:self.tf_weight.text];
        self.tf_weight.text = [NSString stringWithFormat:@"Weight\t\t\t\t\t\t\t\t%@ lb", tmp];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.tf_weight)
    {
        [self.tf_weight resignFirstResponder];
    }
    
    return YES;
}


//make keyboard disappear
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tf_weight resignFirstResponder];
}























@end
