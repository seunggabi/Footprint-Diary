//
//  Emoticon.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Emoticon.h"

@implementation Emoticon

@synthesize e_id;
@synthesize e_name;
@synthesize e_src;

+ (Emoticon *)emoticon:(NSString *)name src:(id)src {
    Emoticon *e = [[Emoticon alloc] init];
    e.e_name = name;
    e.e_src = src;
    return e;
}
- (NSDictionary *)getObj {
    return @{@"e_id":e_id, @"e_name":e_name, @"e_src":e_src};
}

@end
