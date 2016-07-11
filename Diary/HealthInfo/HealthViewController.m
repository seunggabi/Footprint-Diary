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

- (CMPedometer *)pedometer {
    if (!_pedometer) {
        _pedometer = [[CMPedometer alloc]init];
    }
    return _pedometer;
}

- (void)viewDidLoad {
    modelHealth = [[HealthModel alloc] init];
    [modelHealth create];
    modelHealthInfo = [[HealthInformationModel alloc] init];
    
    [super viewDidLoad];
    
    [self loadChartWithDates];
}

#pragma mark - Setting up the charts

- (void)loadChartWithDates {
    //__block NSNumber *tempData;
    /*
     헬스정보팁을 불러오는곳
     */
    /*NSMutableArray *healthInfoList = [[NSMutableArray alloc] init];
     healthInfoList = [modelHealthInfo select:nil];
     
     self.tip1.text = ((HealthInformation *)[healthInfoList objectAtIndex:0]).hi_comment;
     self.tip2.text = @"헬스정보2";*/
    
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        //tempData = pedometerData;
    }];
    [[TimerScheduler getInstance] setPedometerTimer:[NSTimer scheduledTimerWithTimeInterval: 1.0
                                                                                     target: self
                                                                                   selector:@selector(getPedomterCount)
                                                                                   userInfo: nil repeats:YES]];
    
    
    NSLog(@"awqqwer");
    //NSLog(@"%ld", (long)tempData);
    
    // Generating some dummy data
    int oneDayToSec = 1440;
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:oneDayToSec+1];
    for(int i=0;i<oneDayToSec+1;i++) {
        //int temp = [self getPedomterCount];
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

-(void)getPedomterCount {
    Health *health = [[Health alloc] init];
    health.h_time = [NSDate date];
    NSString *today = [[HelperTool getInstance] getToday];
    health.h_date = today;
    NSDate *now = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:now];
    NSDate *start = [gregorian dateFromComponents:components];
    
    // take "now" and normalise to 23:59
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    NSDate *end = [gregorian dateFromComponents:components];
    
    // display results
    [self.pedometer queryPedometerDataFromDate:start toDate:end withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        health.h_count = pedometerData;
        // NSLog(health.h_count);
    }];
    
    [modelHealth insertData:health];
    
    //return (int)health.h_count;
}

@end
