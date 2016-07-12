//
//  Weather.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 11..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Weather.h"

@implementation Weather

@synthesize w_id;
@synthesize w_name;
@synthesize w_src;

+(Weather *) weather:(NSString *)name src:(NSString *)src {
    Weather *w = [[Weather alloc] init];
    w.w_name = name;
    w.w_src = src;
    return w;
}
-(NSDictionary *) getObj {
    return @{@"w_id":w_id, @"w_name":w_name, @"w_src":w_src};
}

@end
//#000000, ffffff