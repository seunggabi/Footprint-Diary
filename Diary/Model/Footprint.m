//
//  Footprint.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Footprint.h"
#import "../Tool/HelperTool.h"

@implementation Footprint

@synthesize fp_id;
@synthesize fp_date;
@synthesize fp_time;
@synthesize fp_GPS_X;
@synthesize fp_GPS_Y;
@synthesize fp_address;
@synthesize fp_h_count;

+(Footprint *) footprint:(NSString *)date time:(NSDate *)time gps_x:(NSNumber *)gps_x gps_y:(NSNumber *)gps_y address:(NSString *)address fp_h_count:(NSNumber *)fp_h_count {
    Footprint *fp = [[Footprint alloc] init];
    fp.fp_date = date;
    fp.fp_time = time;
    fp.fp_GPS_X = gps_x;
    fp.fp_GPS_Y = gps_y;
    fp.fp_address = address;
    fp.fp_h_count = fp_h_count;
    return fp;
}

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"fp_id":fp_id, @"fp_date":fp_date, @"fp_time":fp_time, @"fp_GPS_X":fp_GPS_X, @"fp_GPS_Y":fp_GPS_Y, @"fp_address":fp_address, @"fp_h_count":fp_h_count};
    return obj;
}

-(void) setAddress {
    NSString *urlText = [HelperTool getInstance].getAddressURL;
    urlText = [urlText stringByAppendingString:@"&x="];
    urlText = [urlText stringByAppendingString:[fp_GPS_X stringValue]];
    urlText = [urlText stringByAppendingString:@"&y="];
    urlText = [urlText stringByAppendingString:[fp_GPS_Y stringValue]];
    NSURL *url = [NSURL URLWithString:urlText];
    NSString *data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *address = [NSJSONSerialization JSONObjectWithData:[data dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
    fp_address = address[@"old"][@"name"];
}

@end
