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
@synthesize hi_type;
@synthesize hi_title;
@synthesize hi_comment;
@synthesize hi_link;

-(NSDictionary *) getObj {
    return @{@"hi_id":hi_id, @"hi_type":hi_type, @"hi_title":hi_title, @"hi_comment":hi_comment, @"hi_link":hi_link};
}

@end
