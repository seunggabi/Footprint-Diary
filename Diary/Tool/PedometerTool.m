//
//  PedometerTool.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "PedometerTool.h"
#import "TimerScheduler.h"
#import "HelperTool.h"
#import "HealthModel.h"

@implementation PedometerTool

@synthesize pedometer;
@synthesize modelHealth;

+(PedometerTool *) getInstance {
    static PedometerTool *instance = nil;
    if(instance == nil) {
        instance = [[PedometerTool alloc] init];
        instance.pedometer = [[CMPedometer alloc]init];
        instance.modelHealth = [[HealthModel alloc] init];
    }
    return instance;
}

-(void)start {
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
    }];
    [[TimerScheduler getInstance] setPedometerTimer:[NSTimer scheduledTimerWithTimeInterval:60
                                                                                     target:self
                                                                                   selector:@selector(getPedometerCount)
                                                                                   userInfo:nil
                                                                                    repeats:YES]];
}

-(void)getPedometerCount {
    Health *health = [[Health alloc] init];
    health.h_time = [[HelperTool getInstance] getDate];
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
    [pedometer queryPedometerDataFromDate:start toDate:end withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        health.h_count = pedometerData.numberOfSteps;
        [modelHealth insertData:health];
    }];
}


@end
