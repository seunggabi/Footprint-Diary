//
//  HelperTool.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 11..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "HelperTool.h"
#import "DBConnector.h"
#import "UserModel.h"
#import "FootprintModel.h"
#import "DiaryModel.h"
#import "StickerModel.h"
#import "EmoticonModel.h"
#import "PhotoModel.h"
#import "HealthModel.h"
#import "HealthInformationModel.h"
#import "WeatherModel.h"
  
@implementation HelperTool

@synthesize apiKey;
@synthesize getAddressURL;

+ (HelperTool *)getInstance {
    static HelperTool *instance;
    if(instance == nil){
        instance = [[HelperTool alloc] init];
        instance.apiKey = @"c55252cb847d401d333ca2bd5ed78ba5";
        instance.getAddressURL = @"https://apis.daum.net/local/geo/coord2detailaddr?inputCoordSystem=WGS84&output=json&apikey=";
        instance.getAddressURL = [instance.getAddressURL stringByAppendingString:instance.apiKey];
    }
    return instance;
}

- (void)installDB {
    UserModel *modelUser = [[UserModel alloc] init];
    FootprintModel *modelFootPrint = [[FootprintModel alloc] init];
    DiaryModel *modelDiary = [[DiaryModel alloc] init];
    StickerModel *modelSticker = [[StickerModel alloc] init];
    EmoticonModel *modelEmoticon = [[EmoticonModel alloc] init];
    PhotoModel *modelPhoto = [[PhotoModel alloc] init];
    HealthModel *modelHealth = [[HealthModel alloc] init];
    HealthInformationModel *modelHealthInfo = [[HealthInformationModel alloc] init];
    WeatherModel *modelWeather = [[WeatherModel alloc] init];
    ThemeModel *modelTheme = [[ThemeModel alloc] init];
    
    [modelUser create];
    [modelFootPrint create];
    [modelDiary create];
    [modelSticker create];
    [modelEmoticon create];
    [modelPhoto create];
    [modelHealth create];
    [modelHealthInfo create];
    [modelWeather create];
    [modelTheme create];
}

- (void)removeDB {
    UserModel *modelUser = [[UserModel alloc] init];
    FootprintModel *modelFootPrint = [[FootprintModel alloc] init];
    DiaryModel *modelDiary = [[DiaryModel alloc] init];
    StickerModel *modelSticker = [[StickerModel alloc] init];
    EmoticonModel *modelEmoticon = [[EmoticonModel alloc] init];
    PhotoModel *modelPhoto = [[PhotoModel alloc] init];
    HealthModel *modelHealth = [[HealthModel alloc] init];
    HealthInformationModel *modelHealthInfo = [[HealthInformationModel alloc] init];
    WeatherModel *modelWeather = [[WeatherModel alloc] init];
    ThemeModel *modelTheme = [[ThemeModel alloc] init];
    
    [modelUser drop];
    [modelFootPrint drop];
    [modelDiary drop];
    [modelSticker drop];
    [modelEmoticon drop];
    [modelPhoto drop];
    [modelHealth drop];
    [modelHealthInfo drop];
    [modelWeather drop];
    [modelTheme drop];
}

- (NSString *)getToday {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:date];
    return today;
}

- (NSDate *)getDate {
    NSDate *date = [[NSDate date ] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    return date;
}

- (NSDate *)stringToDate:(NSString *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDate *d = [dateFormat dateFromString:date];
    d = [d initWithTimeInterval:60*60*9 sinceDate:d];
    return d;
}

- (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *d = [dateFormat stringFromDate:date];
    return d;
}

- (Theme *)getTheme {
    UserModel *modelUser = [[UserModel alloc] init];
    ThemeModel *modelTheme = [[ThemeModel alloc] init];
    User *u = [modelUser select];
    Theme *th = [[modelTheme select:[NSString stringWithFormat:@"th_id='%@'",u.u_th_id]] objectAtIndex:0];
    return th;
}

- (UIImage *)changeImageSize:(UIImage *)image newSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIView *)changeScreenDevice:(UIView *)view {
    CGRect frame = [UIScreen mainScreen].bounds;
    view.bounds = frame;
    view.frame = frame;
    
    return view;
}

@end
