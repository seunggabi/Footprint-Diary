//
//  ViewController.m
//  datePicker
//
//  Created by mju on 2016. 7. 11..
//  Copyright © 2016년 recipeGo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize datePicker;
@synthesize button;
@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    datePicker.date = [NSDate date];
    [datePicker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)datePickerBtnAction:(id)sender
{
    datePicker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0,10, 50)];
    datePicker.datePickerMode=UIDatePickerModeDate;
    datePicker.hidden=NO;
    datePicker.date=[NSDate date];
    [datePicker addTarget:self action:@selector(LabelTitle:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    button=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem=button;
}

-(void)LabelTitle:(id)sender
{
    NSDateFormatter *dateFormat=[[NSDateFormatter alloc]init];
    dateFormat.dateStyle=NSDateFormatterMediumStyle;
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateFormat  stringFromDate:datePicker.date]];
    //assign text to label
    label.text=str;
}

-(void)save:(id)sender
{
    self.navigationItem.rightBarButtonItem=nil;
    [datePicker removeFromSuperview];
}
@end
