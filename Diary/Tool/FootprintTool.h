//
//  FootprintTool.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "FootprintModel.h"
#import "UserModel.h"
#import "HealthModel.h"

@interface FootprintTool : NSObject

@property (strong, nonatomic) FootprintModel *modelFootprint;
@property (strong, nonatomic) UserModel *modelUser;
@property (strong, nonatomic) HealthModel *modelHealth;
@property (strong, nonatomic) CLLocationManager *locationManager;

+(FootprintTool *) getInstance;
-(void) start;
-(void) getGPS;
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;

@end
