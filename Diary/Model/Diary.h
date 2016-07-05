//
//  Diary.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum weather {
    SUNNY=0,
    CLOUDY,
    RAINY,
    SNOWY
} WEATHER;

@interface Diary : NSObject

@property (strong, nonatomic) NSNumber *d_id;
@property (strong, nonatomic) NSString *d_date;
@property (strong, nonatomic) NSDate *d_time;
@property (strong, nonatomic) NSNumber *d_weather;
@property (strong, nonatomic) NSString *d_title;
@property (strong, nonatomic) NSString *d_content;
@property (strong, nonatomic) NSNumber *d_e_id;

@end
