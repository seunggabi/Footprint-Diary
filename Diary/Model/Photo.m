//
//  Photo.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Photo.h"

@implementation Photo

@synthesize p_id;
@synthesize p_date;
@synthesize p_src;

+ (Photo *)photo:(NSString *)date src:(NSString *)src {
    Photo *p = [[Photo alloc] init];
    p.p_date = date;
    p.p_src = src;
    return p;
}

- (NSDictionary *)getObj {
    return @{@"p_id":p_id, @"p_date":p_date, @"p_src":p_src};
}

@end
