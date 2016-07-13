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

@synthesize modelHealth;
@synthesize modelHealthInfo;
@synthesize chart;

-(void)viewDidLoad {
    modelHealth = [[HealthModel alloc] init];
    modelHealthInfo = [[HealthInformationModel alloc] init];
    NSString *today = [[HelperTool getInstance] getToday];
    [super viewDidLoad];
    
    [self loadChartWithDate:today];
}

-(void)loadChartWithDate:(NSString *)date {
    NSMutableArray *healthList = [modelHealth select:[NSString stringWithFormat:@"h_date = '%@'", date]];
    for(int i=0; i<healthList.count; i++) {
        NSLog(@"%@",[((Health *)[healthList objectAtIndex:i]) getObj]);
    }
    
    int second = 60*60*24;
    int minute = second/60;
    int startSecond = [[[HelperTool getInstance] stringToDate:date] timeIntervalSince1970];
    NSMutableArray *chartData = [NSMutableArray arrayWithCapacity:minute];
    __block NSMutableArray *xAxis = [NSMutableArray arrayWithCapacity:minute];
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

@end
