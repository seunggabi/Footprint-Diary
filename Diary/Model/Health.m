//
//  Health.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Health.h"

@implementation Health

@synthesize h_id;
@synthesize h_date;
@synthesize h_time;
@synthesize h_count;

-(NSDictionary *) getObj {
    return @{@"h_id":h_id, @"h_date":h_date, @"h_time":h_time, @"h_count":h_count};
}

@end
