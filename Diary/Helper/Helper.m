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

+(Helper *) getInstance {
    static Helper *instance;
    if(instance == nil) {
        instance = [[Helper alloc] init];
        instance.apiKey = @"6b7224206f752f1cf8d8d7b49546d424";
    }
    return instance;
}

-(NSString *) getToday {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:date];
    return today;
}

@end
