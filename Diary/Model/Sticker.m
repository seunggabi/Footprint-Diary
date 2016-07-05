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
@synthesize color;
@synthesize s_e_id;

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"s_id":s_id, @"s_date":s_date, @"color":color, @"s_e_id":s_e_id};
    return obj;
} 

@end
