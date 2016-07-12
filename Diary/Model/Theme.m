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
    return @{@"tree.jpg":th_id, @"Tree":th_name, @"#aaaaaa":th_top, @"#aaaaaa":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"balloon.jpg":th_id, @"Balloon":th_name, @"#ecdfbd":th_top, @"#ecdfbd":th_bottom, @"#444444":th_font, @"#000000":th_main};
    return @{@"bottle.jpg":th_id, @"Bottle":th_name, @"#98a590":th_top, @"#98a590":th_bottom, @"#ffffff":th_font, @"#000000":th_main};
    return @{@"cactus.jpg":th_id, @"Cactus":th_name, @"#85c4b9":th_top, @"#85c4b9":th_bottom, @"#ffffff":th_font, @"#000000":th_main};
    return @{@"city.jpg":th_id, @"City":th_name, @"#aaaaaa":th_top, @"#aaaaaa":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"cloud.jpg":th_id, @"Cloud":th_name, @"#aaaaaa":th_top, @"#aaaaaa":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"FerrisWheel.jpg":th_id, @"FerrisWheel":th_name, @"#69d2e7":th_top, @"#69d2e7":th_bottom, @"#ffffff":th_font, @"#000000":th_main};
    return @{@"firework.jpg":th_id, @"Firework":th_name, @"#aaaaaa":th_top, @"#aaaaaa":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"flower.jpg":th_id, @"Flower":th_name, @"#e8928d":th_top, @"#e8928d":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"greek.jpg":th_id, @"Greek":th_name, @"#ffe6e6":th_top, @"#ffe6e6":th_bottom, @"#ff8080":th_font, @"#000000":th_main};
    return @{@"icecream.jpg":th_id, @"Icecream":th_name, @"#ffffff":th_top, @"#ffffff":th_bottom, @"#000000":th_font, @"#ffffff":th_main};
    
    return @{@"ocean.jpg":th_id, @"Ocean":th_name, @"#ffffff":th_top, @"#ffffff":th_bottom, @"#000000":th_font, @"#ffffff":th_main};
    return @{@"rainywindow.jpg":th_id, @"Rainywindow":th_name, @"#000000":th_top, @"#000000":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"sea.jpg":th_id, @"Sea":th_name, @"#28abe3":th_top, @"#28abe3":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"sea2.jpg":th_id, @"Sea2":th_name, @"#69d2e7":th_top, @"#69d2e7":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"skyline.jpg":th_id, @"Skyline":th_name, @"#000000":th_top, @"#000000":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"skyflower.jpg":th_id, @"Skyflower":th_name, @"#f0b09b":th_top, @"#f0b09b":th_bottom, @"#ffffff":th_font, @"#ffffff":th_main};
    return @{@"tower.jpg":th_id, @"Tower":th_name, @"#aaaaaa":th_top, @"#aaaaaa":th_bottom, @"#ffffff":th_font, @"#000000":th_main};
    
}

@end
