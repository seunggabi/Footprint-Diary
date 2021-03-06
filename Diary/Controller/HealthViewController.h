//
//  ViewController.h
//  FSLineChart
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c)2014 Arthur GUIBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerScheduler.h"
#import "HealthModel.h"
#import "HealthInformationModel.h"
#import "HelperTool.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"

@import CoreMotion;

@interface HealthViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSString *selectDate;
@property (strong, nonatomic) IBOutlet UITextField *healthView;
@property (strong, nonatomic) IBOutlet UITextView *tip1;
@property (strong, nonatomic) IBOutlet UITextView *tip2;
@property (strong, nonatomic) IBOutlet UIView *datePickerScreen;
@property (strong, nonatomic) IBOutlet UITextField *yearView;
@property (strong, nonatomic) IBOutlet UITextField *monthView;
@property (strong, nonatomic) IBOutlet UITextField *dayView;

@property (strong, nonatomic) IBOutlet FSLineChart *chart;
@property (strong, nonatomic) HealthModel *modelHealth;
@property (strong, nonatomic) HealthInformationModel *modelHealthInfo;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)touchDate:(id)sender;
- (IBAction)searchHealth:(id)sender;

- (void)chartDraw;
- (void)viewSetting;
- (void)changeDatePicker;

@end