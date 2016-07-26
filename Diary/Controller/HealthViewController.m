//
//  ViewController.m
//  FSLineChart
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c) 2014 Arthur GUIBERT. All rights reserved.
//

#import "HealthViewController.h"

@interface HealthViewController ()

@end

@implementation HealthViewController

@synthesize selectDate;
@synthesize modelHealth;
@synthesize modelHealthInfo;
@synthesize chart;
@synthesize healthView;
@synthesize tip1;
@synthesize tip2;
@synthesize yearView;
@synthesize monthView;
@synthesize dayView;
@synthesize datePicker;
@synthesize datePickerScreen;

-(void) viewDidLoad {
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated {
    modelHealth = [[HealthModel alloc] init];
    modelHealthInfo = [[HealthInformationModel alloc] init];
    if(selectDate == nil) {
        selectDate = [[HelperTool getInstance] getToday];
    }
    [self viewSetting];
    [self changeDatePicker];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.date = [NSDate date];
    [datePicker addTarget:self action:@selector(changeDatePicker) forControlEvents:UIControlEventValueChanged];
    datePickerScreen.hidden = YES;
    yearView.delegate = self;
    monthView.delegate = self;
    dayView.delegate = self;
}

-(IBAction)touchDate:(id)sender {
    [self viewSetting];
    datePickerScreen.hidden = NO;
    [yearView endEditing:YES];
    [monthView endEditing:YES];
    [dayView endEditing:YES];
}

-(IBAction)searchHealth:(id)sender {
    datePickerScreen.hidden = YES;
    [yearView endEditing:YES];
    [monthView endEditing:YES];
    [dayView endEditing:YES];
    if(datePicker.hidden == NO)
        selectDate = [[HelperTool getInstance] dateToString:datePicker.date];
    [self viewSetting];
}

-(void) chartDraw {
    NSMutableArray *healthList = [modelHealth select:[NSString stringWithFormat:@"h_date = '%@'", selectDate]];
    
    int second = 60*60*24;
    int minute = second/60;
    int startSecond = [[[HelperTool getInstance] stringToDate:selectDate] timeIntervalSince1970];
    NSMutableArray *chartData = [NSMutableArray arrayWithCapacity:minute];
    NSMutableArray *xAxis = [NSMutableArray arrayWithCapacity:minute];
    for(int i=0; i<minute; i++) {
        chartData[i] = @0;
        xAxis[i] = [NSString stringWithFormat:@"%d", i/60];
    }
    
    for(int i=0;i<healthList.count;i++) {
        Health *h = ((Health *)[healthList objectAtIndex:i]);
        chartData[((int)[h.h_time timeIntervalSince1970]-startSecond)/60] = h.h_count;
    }
    
    int min = 0; 
    for(int i=0; i<minute; i++) {
        if(min < [chartData[i] intValue]) {
            min=[chartData[i] intValue];
        } else {
           chartData[i]=[NSNumber numberWithInt:min];
        }
    }
    
    chart.verticalGridStep = 10;
    chart.horizontalGridStep = 24;
    chart.fillColor = nil;
    chart.displayDataPoint = NO;
    chart.dataPointColor = [UIColor fsOrange];
    chart.dataPointBackgroundColor = [UIColor fsOrange];
    chart.dataPointRadius = 0;
    chart.bezierSmoothing = YES;
    chart.color = [chart.dataPointColor colorWithAlphaComponent:1.0];
    chart.valueLabelPosition = ValueLabelRight;
    
    chart.labelForIndex = ^(NSUInteger item) {
        return xAxis[item];
    };
    
    chart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.0f 걸음", value];
    };
    
    [chart setChartData:chartData];
}

-(void) viewSetting {
    [self setDateView];
    Health *h = [modelHealth recentData:selectDate];
    if(h == nil) {
        h = [[Health alloc] init];
        h.h_count = @0;
    }
    healthView.text = [h.h_count stringValue];
    NSMutableArray<HealthInformation *> *tips = [modelHealthInfo getInfoTwo];
    tip1.text = [tips objectAtIndex:0].hi_comment;
    tip2.text = [tips objectAtIndex:1].hi_comment;
    [self chartDraw];
}

-(void) setDateView {
    NSArray *dateElement = [selectDate componentsSeparatedByString:@"-"];
    yearView.text = [dateElement objectAtIndex:0];
    monthView.text = [dateElement objectAtIndex:1];
    dayView.text = [dateElement objectAtIndex:2];
}

-(void) changeDatePicker {
    selectDate = [[HelperTool getInstance] dateToString:datePicker.date];
    [self setDateView];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
