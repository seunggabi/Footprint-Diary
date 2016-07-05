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
@synthesize GPS_X;
@synthesize GPS_Y;
@synthesize address;

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"fp_id":fp_id, @"fp_date":fp_date, @"fp_time":fp_time, @"GPS_X":GPS_X, @"GPS_Y":GPS_Y, @"address":address};
    return obj;
}

@end
