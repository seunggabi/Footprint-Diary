//
//  HealthInformation.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "HealthInformation.h"

@implementation HealthInformation

@synthesize hi_id;
@synthesize hi_comment;

+ (HealthInformation *)healthInformation:(NSString *)comment {
    HealthInformation *hi = [[HealthInformation alloc] init];
    hi.hi_comment = comment;
    return hi;
}

- (NSDictionary *)getObj {
    return @{@"hi_id":hi_id, @"hi_comment":hi_comment};
}

@end
