//
//  FootprintTool.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintTool.h"
#import "HelperTool.h"
#import "TimerScheduler.h"

@implementation FootprintTool 

@synthesize modelUser;
@synthesize modelFootprint;
@synthesize locationManager;

+(FootprintTool *) getInstance {
    static FootprintTool *instance = nil;
    if(instance == nil) {
        instance = [[FootprintTool alloc] init];
        instance.modelFootprint = [[FootprintModel alloc] init];
        instance.modelUser = [[UserModel alloc] init];
    }
    return instance;
}

-(void) start {
    User *u = [modelUser select];
    locationManager = [[CLLocationManager alloc]init];
    [[TimerScheduler getInstance] setFootprintTiemr:[NSTimer scheduledTimerWithTimeInterval:[u.u_timer intValue]>0?[u.u_timer intValue]:1*10
                                                                                     target:self
                                                                                   selector:@selector(getGPS)
                                                                                   userInfo:nil
                                                                                    repeats:YES]];
}

- (void)getGPS {
    NSLog(@"start GPS");
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [locationManager stopUpdatingLocation];
    CLLocation *crnLoc = [locations lastObject];
    NSNumber *lat = [NSNumber numberWithDouble:crnLoc.coordinate.latitude];
    NSNumber *log = [NSNumber numberWithDouble:crnLoc.coordinate.longitude];
    Footprint *fp = [[Footprint alloc] init];
    fp.fp_date = [[HelperTool getInstance] getToday];
    fp.fp_time = [[HelperTool getInstance] getDate];
    fp.fp_GPS_X = log;
    fp.fp_GPS_Y = lat;
    [fp setAddress];
    [modelFootprint insertData:fp];
    
    NSDictionary *d = [[[modelFootprint select:@"1=1 ORDER BY fp_id DESC"] objectAtIndex:0] getObj];
    NSLog(@"%@", d);
    NSLog(@"stop GPS");
}

@end
