//
//  Sticker.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Sticker.h"

@implementation Sticker

@synthesize s_id;
@synthesize s_date;
@synthesize s_e_id;

+ (Sticker *)sticker:(NSString *)date e_id:(NSNumber *)e_id {
    Sticker *s = [[Sticker alloc] init];
    s.s_date = date;
    s.s_e_id = e_id;
    return s;
}

- (NSDictionary *)getObj {
    NSDictionary *obj = @{@"s_id":s_id, @"s_date":s_date, @"s_e_id":s_e_id};
    return obj;
} 

@end
