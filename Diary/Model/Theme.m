//
//  Theme.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 8..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Theme.h"

@implementation Theme

@synthesize th_id;
@synthesize th_name;
@synthesize th_top;
@synthesize th_main;
@synthesize th_bottom;
@synthesize th_font;

+(Theme *)theme:(NSString *)name top:(NSString *)top main:(NSString *)main bottom:(NSString *)bottom font:(NSString *)font {
    Theme *t = [[Theme alloc] init];
    t.th_name = name;
    t.th_top = top;
    t.th_main = main;
    t.th_bottom = bottom;
    t.th_font = font;
    return t;
}
-(NSDictionary *) getObj {
    return @{@"th_id":th_id, @"th_name":th_name, @"th_top":th_top, @"th_bottom":th_bottom, @"th_font":th_font, @"th_main":th_main};
}

@end
