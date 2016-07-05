//
//  Footprint.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Footprint.h"

@implementation Footprint

@synthesize fp_id;
@synthesize fp_date;
@synthesize fp_time;
@synthesize fp_GPS_X;
@synthesize fp_GPS_Y;
@synthesize fp_address;

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"fp_id":fp_id, @"fp_date":fp_date, @"fp_time":fp_time, @"fp_GPS_X":fp_GPS_X, @"fp_GPS_Y":fp_GPS_Y, @"fp_address":fp_address};
    return obj;
}

@end
