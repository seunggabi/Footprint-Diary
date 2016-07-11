//
//  HelperTool.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 11..
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

-(void) installDB {
    UserModel *modelUser = [[UserModel alloc] init];
    FootprintModel *modelFootPrint = [[FootprintModel alloc] init];
    DiaryModel *modelDiary = [[DiaryModel alloc] init];
    StickerModel *modelSticker = [[StickerModel alloc] init];
    EmoticonModel *modelEmoticon = [[EmoticonModel alloc] init];
    PhotoModel *modelPhoto = [[PhotoModel alloc] init];[modelUser create];
    HealthModel *modelHealth = [[HealthModel alloc] init];
    HealthInformationModel *modelHealthInfo = [[HealthInformationModel alloc] init];
    
    [modelUser create];
    [modelFootPrint create];
    [modelDiary create];
    [modelSticker create];
    [modelEmoticon create];
    [modelPhoto create];
    [modelHealth create];
    [modelHealthInfo create];
}

-(void) removeDB {
    UserModel *modelUser = [[UserModel alloc] init];
    FootprintModel *modelFootPrint = [[FootprintModel alloc] init];
    DiaryModel *modelDiary = [[DiaryModel alloc] init];
    StickerModel *modelSticker = [[StickerModel alloc] init];
    EmoticonModel *modelEmoticon = [[EmoticonModel alloc] init];
    PhotoModel *modelPhoto = [[PhotoModel alloc] init];[modelUser create];
    HealthModel *modelHealth = [[HealthModel alloc] init];
    HealthInformationModel *modelHealthInfo = [[HealthInformationModel alloc] init];
    
    [modelUser drop];
    [modelFootPrint drop];
    [modelDiary drop];
    [modelSticker drop];
    [modelEmoticon drop];
    [modelPhoto drop];
    [modelHealth drop];
    [modelHealthInfo drop];
}

-(NSString *) getToday {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:date];
    return today;
}

-(NSDate *) getDate {
    NSDate *date = [[NSDate date ] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    return date;
}

@end
