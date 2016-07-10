//
//  Functions.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Helper.h"

@implementation Helper

@synthesize apiKey;
@synthesize getAddressURL;

+(Helper *) getInstance {
    static Helper *instance;
    if(instance == nil) {
        instance = [[Helper alloc] init];
        instance.apiKey = @"c55252cb847d401d333ca2bd5ed78ba5";
        instance.getAddressURL = @"https://apis.daum.net/local/geo/coord2detailaddr?inputCoordSystem=WGS84&output=json&apikey=";
        instance.getAddressURL = [instance.getAddressURL stringByAppendingString:instance.apiKey];
    }
    return instance;
}

-(NSString *) getToday {
    NSDate *date = [[NSDate date ] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:date];
    return today;
}

-(NSDate *) getDate {
    NSDate *date = [[NSDate date ] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    return date;
}

@end
