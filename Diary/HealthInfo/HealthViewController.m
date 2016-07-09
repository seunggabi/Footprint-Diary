//
//  ViewController.m
//  FSLineChart
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c) 2014 Arthur GUIBERT. All rights reserved.
//

#import "HealthViewController.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"
#import "PedometerViewController.h"
#import "HistoricViewController.h"
#import "../Model/HealthInformation.h"

@interface HealthViewController ()

@property (strong, nonatomic) IBOutlet UILabel *tip1;
@property (strong, nonatomic) IBOutlet UILabel *tip2;
@property (nonatomic, strong) IBOutlet FSLineChart *chart;
@property (strong, nonatomic) IBOutlet FSLineChart *chartWithDates;
@property (strong, nonatomic) HealthInformation *hi;

@end

@implementation HealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self loadSimpleChart];
    [self loadChartWithDates];
}

#pragma mark - Setting up the charts

- (void)loadChartWithDates {
    self.hi = [[HealthInformation alloc] init];
    self.hi.hi_comment = @"헬스정보1";
    self.tip1.text = self.hi.hi_comment;
    self.tip2.text = @"헬스정보2";

    // Generating some dummy data
    int oneDayToSec = 7200;
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:oneDayToSec+1];
    for(int i=0;i<oneDayToSec+1;i++) {
        chartData[i] = [NSNumber numberWithFloat: 1/*(float)i / 30.0f + (float)(rand() % 100)*/];
    }
    NSMutableArray* months = [NSMutableArray arrayWithCapacity:oneDayToSec];
    
    //for(int i=0; i<oneDayToSec)
    for(int i=0; i<oneDayToSec+1; i++) {
        NSString *str;
        if(i % (oneDayToSec / 12) == 0){
            int temp = i / (oneDayToSec / 24);
            str = [NSString stringWithFormat:@"%d", temp];
        }else{
            str = [NSString stringWithFormat:@"%d", i];
        }
        [months addObject: str];
        //NSLog(@"%@", months);
        }
    
    _chartWithDates.verticalGridStep = 6;
    _chartWithDates.horizontalGridStep = oneDayToSec;
    _chartWithDates.fillColor = nil;
    _chartWithDates.displayDataPoint = YES;
    _chartWithDates.dataPointColor = [UIColor fsOrange];
    _chartWithDates.dataPointBackgroundColor = [UIColor fsOrange];
    _chartWithDates.dataPointRadius = 0;
    _chartWithDates.color = [_chartWithDates.dataPointColor colorWithAlphaComponent:1.0];
    _chartWithDates.valueLabelPosition = ValueLabelLeftMirrored;
    
    _chartWithDates.labelForIndex = ^(NSUInteger item) {
        return months[item];
    };
    
    _chartWithDates.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.0f 회", value];
    };
    
    [_chartWithDates setChartData:chartData];
}

@end
