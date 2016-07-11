//
//  ViewController.m
//  tttttt
//
//  Created by mju on 2016. 7. 11..
//  Copyright © 2016년 recipeGo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize <#property#>
- (void)viewDidLoad {
    [super viewDidLoad];
    datePickerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 216+44)];
    
    //picker
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 320, 216)];
    [datePicker addTarget:self action:@selector(changeDateInLabel:)forControlEvents:UIControlEventValueChanged];
    datePicker.datePickerMode = UIDatePickerModeDate;
    //pickerSex.alpha = 0.5;
    
    datePickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0 , 320, 44)];
    datePickerToolbar.barStyle = UIBarStyleBlackTranslucent;
    [datePickerview addSubview:datePickerToolbar];
    
    UIBarButtonItem *btnLeft2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *btnCenter2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *btnExcute2 = [[UIBarButtonItem alloc] initWithTitle:@"완료" style:UIBarButtonItemStyleBorderedtarget:self action:@selector(onDoneDataPicker:)];
    
    NSArray *itmes2 = [[NSArray alloc] initWithObjects:btnLeft2, btnCenter2, btnExcute2, nil];
    [btnLeft2 release];[btnCenter2 release];[btnExcute2 release];
    
    [datePickerToolbar setItems:itmes2 animated:YES];
    [itmes2 release];
    
    
    [datePickerview addSubview:datePicker];
    [self.view addSubview:datePickerview];
    datePickerview.frame = CGRectMake(0, 460, 320, 216+44);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// ++ 데이트피커뷰를 움직였을 때 실행됨. ++
- (void) changeDateInLabel:(id)sender
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY.MM.dd"];
    lbBirthday.text = [NSString stringWithFormat:@"%@",
                       [dateFormat stringFromDate:datePicker.date]];
    [dateFormat release];
}



//show
- (void) showDatePickerView
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"YYYY.MM.dd"];
    
    NSDate *anyDate = [dateFormat dateFromString:lbBirthday.text];
    [datePicker setDate:anyDate];
    
    [tbview setContentOffset:CGPointMake(0, 150) animated:YES];
    
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:0.3];
    datePickerview.frame = CGRectMake(0, 156, 320, 216+44);
    [UIView commitAnimations];
}



//hide
- (void) hideDatePickerView
{
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:0.3];
    datePickerview.frame = CGRectMake(0, 460, 320, 216+44);
    [UIView commitAnimations];
}
@end
