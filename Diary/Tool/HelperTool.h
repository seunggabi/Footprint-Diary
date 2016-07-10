//
//  HelperTool.h
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

#import <Foundation/Foundation.h>

@interface HelperTool : NSObject

@property (strong, nonatomic) NSString *apiKey;
@property (strong, nonatomic) NSString *getAddressURL;

+(HelperTool *) getInstance;

-(void) installDB;
-(void) removeDB;
-(NSString *) getToday;
-(NSDate *) getDate;

@end
