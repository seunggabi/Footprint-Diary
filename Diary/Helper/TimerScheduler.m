//
//  TimerScheduler.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "TimerScheduler.h"

@implementation TimerScheduler

@synthesize footprintTiemr;
@synthesize pedometerTimer;

+(TimerScheduler *) getInstance {
    static TimerScheduler *instance = nil;
    
    if(instance == nil) {
        instance = [[TimerScheduler alloc] init];
    }
    return instance;
}

-(void) setFootprintTiemr:(NSTimer *)t; {
    if(footprintTiemr != nil) {
        [footprintTiemr invalidate];
    }
    footprintTiemr = t;
}

-(void) setPedometerTimer:(NSTimer *)t {
    if(footprintTiemr != nil) {
        [footprintTiemr invalidate];
    }
    footprintTiemr = t;
}

@end
  