//
//  AddReadingRecordPopupViewController.m
//  BookShelf
//
//  Created by Brian Hu on 6/29/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import "AddReadingRecordPopupViewController.h"

@interface AddReadingRecordPopupViewController ()
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation AddReadingRecordPopupViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIDatePicker *timePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 250, 0, 0)];
    [timePicker addTarget:self action:@selector(pickerChanged:)               forControlEvents:UIControlEventValueChanged];
    timePicker.datePickerMode = UIDatePickerModeDate;
    [_dateField setInputView:timePicker];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:@"d/M/Y"];
    
    _dateField.text = [_dateFormatter stringFromDate:[NSDate date]];
    _date = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)submit:(id)sender {
    [_delegate dataSubmitted:_date hour:[_hourField.text integerValue]];
}

#pragma mark - private
- (void)pickerChanged:(id)sender
{
    _date = [sender date];
    _dateField.text = [_dateFormatter stringFromDate:[sender date]];
}
@end
