//
//  TimerScheduler.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerScheduler : NSObject

@property (strong, nonatomic) NSTimer *footprintTiemr;
@property (strong, nonatomic) NSTimer *pedometerTimer;

+(TimerScheduler *) getInstance;
-(void) setFootprintTiemr:(NSTimer *)footprintTiemr;
-(void) setPedometerTimer:(NSTimer *)pedometerTimer;

@end
 