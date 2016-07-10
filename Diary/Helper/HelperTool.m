//
//  Functions.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "HelperTool.h"
#import "../Model/DBConnector.h"
#import "../Model/UserModel.h"
#import "../Model/FootprintModel.h"
#import "../Model/DiaryModel.h"
#import "../Model/StickerModel.h"
#import "../Model/EmoticonModel.h"
#import "../Model/PhotoModel.h"
#import "../Model/HealthModel.h"
#import "../Model/HealthInformationModel.h"

@implementation HelperTool
 
@synthesize apiKey;
@synthesize getAddressURL;

+(HelperTool *) getInstance {
    static HelperTool *instance;
    if(instance == nil) {
        instance = [[HelperTool alloc] init];
        instance.apiKey = @"c55252cb847d401d333ca2bd5ed78ba5";
        instance.getAddressURL = @"https://apis.daum.net/local/geo/coord2detailaddr?inputCoordSystem=WGS84&output=json&apikey=";
        instance.getAddressURL = [instance.getAddressURL stringByAppendingString:instance.apiKey];
    }
    return instance;
}

-(NSString *) getToday {
    NSDate *date = [[NSDate date ] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:date];
    return today;
}

-(NSDate *) getDate {
    NSDate *date = [[NSDate date ] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    return date;
}

-(void) settingDB {
    UserModel *modelUser = [[UserModel alloc] init];
    [modelUser create];
    FootprintModel *modelFootPrint = [[FootprintModel alloc] init];
    [modelFootPrint create];
    DiaryModel *modelDiary = [[DiaryModel alloc] init];
    [modelDiary create];
    StickerModel *modelSticker = [[StickerModel alloc] init];
    [modelSticker create];
    EmoticonModel *modelEmoticon = [[EmoticonModel alloc] init];
    [modelEmoticon create];
    PhotoModel *modelPhoto = [[PhotoModel alloc] init];
    [modelPhoto create];
    HealthModel *modelHealth = [[HealthModel alloc] init];
    [modelHealth create];
    HealthInformationModel *modelHealthInfo = [[HealthInformationModel alloc] init];
    [modelHealthInfo create];
}

@end
