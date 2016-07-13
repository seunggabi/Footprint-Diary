//
//  ViewController.h
//  FSLineChart
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c) 2014 Arthur GUIBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerScheduler.h"
#import "HealthModel.h"
#import "HealthInformationModel.h"
#import "HelperTool.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"

@import CoreMotion;

@interface HealthViewController : UIViewController

@property (strong, nonatomic) NSString *selectDate;
@property (strong, nonatomic) IBOutlet UITextField *healthView;
@property (strong, nonatomic) IBOutlet UITextView *tip1;
@property (strong, nonatomic) IBOutlet UITextView *tip2;
@property (strong, nonatomic) IBOutlet UITextField *yearView;
@property (strong, nonatomic) IBOutlet UITextField *monthView;
@property (strong, nonatomic) IBOutlet UITextField *dayView;

@property (strong, nonatomic) IBOutlet FSLineChart *chart;
@property (strong, nonatomic) HealthModel *modelHealth;
@property (strong, nonatomic) HealthInformationModel *modelHealthInfo;

-(void) loadChartWithDate:(NSString *)date;
-(void) viewSetting;

@end