//
//  PedometerTool.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HealthModel.h"

@import CoreMotion;
@interface PedometerTool : NSObject

@property (strong, nonatomic) CMPedometer *pedometer;
@property (strong, nonatomic) HealthModel *modelHealth;

+ (PedometerTool *)getInstance;
- (void)start;
- (void)getPedometerCount;

@end
