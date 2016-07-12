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
    return @{@"w_id":w_id, @"해와바람":w_name, @"windy.png":w_src};
    return @{@"w_id":w_id, @"서풍":w_name, @"wind5.png":w_src};
    return @{@"w_id":w_id, @"세게흔들리는병":w_name, @"wind-4.png":w_src};
    return @{@"w_id":w_id, @"약하게흔들리는병":w_name, @"wind-3.png":w_src};
    return @{@"w_id":w_id, @"강한서풍":w_name, @"wind-2.png":w_src};
    return @{@"w_id":w_id, @"비와바람":w_name, @"wing-1.png":w_src};
    return @{@"w_id":w_id, @"구름달과비":w_name, @"weather.png":w_src};
    return @{@"w_id":w_id, @"강하게흔들리는병":w_name, @"weather-1.png":w_src};
    return @{@"w_id":w_id, @"파도":w_name, @"waves.png":w_src};
    return @{@"w_id":w_id, @"비우산":w_name, @"umbrellas.png":w_src};
    return @{@"w_id":w_id, @"우산":w_name, @"umbrella.png":w_src};
    return @{@"w_id":w_id, @"뒤집힌우산":w_name, @"unbrella-1.png":w_src};
    return @{@"w_id":w_id, @"토네이도":w_name, @"tornado.png":w_src};
    return @{@"w_id":w_id, @"강한물결":w_name, @"tide.png":w_src};
    return @{@"w_id":w_id, @"잔잔한물결":w_name, @"tide-1.png":w_src};
    return @{@"w_id":w_id, @"습도높음":w_name, @"temperature.png":w_src};
    return @{@"w_id":w_id, @"영하":w_name, @"temperature-2.png":w_src};
    return @{@"w_id":w_id, @"영상":w_name, @"temperature-1.png":w_src};
    
    return @{@"w_id":w_id, @"태양":w_name, @"sunset.png":w_src};
    return @{@"w_id":w_id, @"바다위태양":w_name, @"sunset-2.png":w_src};
    return @{@"w_id":w_id, @"일몰":w_name, @"sunset-1.png":w_src};
    return @{@"w_id":w_id, @"일출":w_name, @"sunrise.png":w_src};
    return @{@"w_id":w_id, @"맑음":w_name, @"sunny.png":w_src};
    return @{@"w_id":w_id, @"해와비":w_name, @"summer-rain.png":w_src};
    return @{@"w_id":w_id, @"해와벼락":w_name, @"storm":w_src};
    return @{@"w_id":w_id, @"밤벼락1":w_name, @"storm-2.png":w_src};
    return @{@"w_id":w_id, @"밤벼락2":w_name, @"storm-1.png":w_src};
    return @{@"w_id":w_id, @"구름과별1":w_name, @"stars.png":w_src};
    return @{@"w_id":w_id, @"별똥별":w_name, @"stars-2.png":w_src};
    return @{@"w_id":w_id, @"구름과별2":w_name, @"stars-1.png":w_src};
    return @{@"w_id":w_id, @"해뜨고눈":w_name, @"snowy.png":w_src};
    return @{@"w_id":w_id, @"함박눈":w_name, @"snowing.png":w_src};
    return @{@"w_id":w_id, @"흐리고눈":w_name, @"snowing-1.png":w_src};
    return @{@"w_id":w_id, @"눈송이":w_name, @"snowflake.png":w_src};
    return @{@"w_id":w_id, @"저녁흐리고눈":w_name, @"snow.png":w_src};
    return @{@"w_id":w_id, @"아침비":w_name, @"rainy.png":w_src};
    return @{@"w_id":w_id, @"소나기":w_name, @"raining.png":w_src};
    
    return @{@"w_id":w_id, @"물방울":w_name, @"raindrops.png":w_src};
    return @{@"w_id":w_id, @"무지개":w_name, @"rainbow.png":w_src};
    return @{@"w_id":w_id, @"해무지개":w_name, @"rainbow-2.png":w_src};
    return @{@"w_id":w_id, @"구름무지개":w_name, @"rainbow-1.png":w_src};
    return @{@"w_id":w_id, @"밤눈":w_name, @"night-snow.png":w_src};
    return @{@"w_id":w_id, @"밤비":w_name, @"night-rain.png":w_src};
    return @{@"w_id":w_id, @"아침눈":w_name, @"morning-snow.png":w_src};
    return @{@"w_id":w_id, @"흐린비":w_name, @"morning-rain.png":w_src};
    return @{@"w_id":w_id, @"달과해":w_name, @"moon7.png":w_src};
    return @{@"w_id":w_id, @"바다위달":w_name, @"moon-6.png":w_src};
    return @{@"w_id":w_id, @"지는달":w_name, @"moon-5.png":w_src};
    return @{@"w_id":w_id, @"바다위초승달":w_name, @"moon-4.png":w_src};
    return @{@"w_id":w_id, @"뜨는달":w_name, @"moon-3.png":w_src};
    return @{@"w_id":w_id, @"초승달과별":w_name, @"moon-2.png":w_src};
    return @{@"w_id":w_id, @"초승달":w_name, @"moon-1.png":w_src};

    return @{@"w_id":w_id, @"빙하":w_name, @"icicle,png":w_src};
    return @{@"w_id":w_id, @"우박":w_name, @"hall.png":w_src};
    return @{@"w_id":w_id, @"화씨":w_name, @"farenheit.png":w_src};
    return @{@"w_id":w_id, @"식":w_name, @"eclippse.png":w_src};
    return @{@"w_id":w_id, @"흐린밤":w_name, @"cloudy-night.png":w_src};
    return @{@"w_id":w_id, @"흐린날1":w_name, @"clouds/sun.png":w_src};
    return @{@"w_id":w_id, @"구름":w_name, @"clouds.png":w_src};
    return @{@"w_id":w_id, @"흐린날2":w_name, @"clouds-1.png":w_src};
    return @{@"w_id":w_id, @"섭씨":w_name, @"celsius.png":w_src};
    return @{@"w_id":w_id, @"잔잔한":w_name, @"calm.png":w_src};
    return @{@"w_id":w_id, @"벼락":w_name, @"bolt.png":w_src};


}

@end
