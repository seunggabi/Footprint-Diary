//
//  Theme.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 8..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "Theme.h"

@implementation Theme

@synthesize th_top;
@synthesize th_bottom;
@synthesize th_main;
@synthesize th_font;

-(NSDictionary *) getObj {
    return @{@"th_top":th_top, @"th_bottom":th_bottom, @"th_font":th_font, @"th_main":th_main};
}

@end
