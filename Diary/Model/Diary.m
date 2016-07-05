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
@synthesize weather;
@synthesize title;
@synthesize content;
@synthesize d_e_id;

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"d_id":d_id, @"d_date":d_date, @"d_time":d_time, @"weather":weather, @"title":title, @"content":content, @"e_id":d_e_id};
    return obj;
}

@end
