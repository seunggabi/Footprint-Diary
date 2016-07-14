//
//  HelperTool.h
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
#import "ThemeModel.h"
#import "HealthInformationModel.h"

#import <Foundation/Foundation.h>

@interface HelperTool : NSObject

@property (strong, nonatomic) NSString *apiKey;
@property (strong, nonatomic) NSString *getAddressURL;

+(HelperTool *) getInstance;
-(void) installDB;
-(void) removeDB;
-(NSString *) getToday;
-(NSDate *) getDate;
-(NSDate *) stringToDate:(NSString *)date;
-(NSString *) dateToString:(NSDate *)date;
-(Theme *) getTheme;

@end
