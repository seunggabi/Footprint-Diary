//
//  Diary.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Diary.h"

@implementation Diary

@synthesize d_id;
@synthesize d_date;
@synthesize d_time;
@synthesize d_w_id;
@synthesize d_title;
@synthesize d_content;
@synthesize d_e_id;

+(Diary *) diary:(NSString *)date time:(NSDate *)time w_id:(NSNumber *)w_id title:(NSString *)title content:(NSString *)content e_id:(NSNumber *)e_id {
    Diary *d = [[Diary alloc] init];
    d.d_date = date;
    d.d_time = time;
    d.d_w_id = w_id;
    d.d_title = title;
    d.d_content = content;
    d.d_e_id = e_id;
    return d;
}

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"d_id":d_id, @"d_date":d_date, @"d_time":d_time, @"d_w_id":d_w_id, @"d_title":d_title, @"d_content":d_content, @"e_id":d_e_id};
    return obj;
}

@end
