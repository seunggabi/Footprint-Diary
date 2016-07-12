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

@property (strong, nonatomic) IBOutlet UILabel *tip1;
@property (strong, nonatomic) IBOutlet UILabel *tip2;
@property (nonatomic, strong) IBOutlet FSLineChart *chart;
@property (strong, nonatomic) IBOutlet FSLineChart *chartWithDates;
@property (strong, nonatomic) CMPedometer *pedometer;
@property (strong, nonatomic) HealthModel *modelHealth;
@property (strong, nonatomic) HealthInformationModel *modelHealthInfo;

@end