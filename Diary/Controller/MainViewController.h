//
//  ViewController.h
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Model/DBConnector.h"
#import "../Model/UserModel.h"
#import "../Model/FootprintModel.h"
#import "../Model/DiaryModel.h"
#import "../Model/StickerModel.h"
#import "../Model/EmoticonModel.h"
#import "../Model/PhotoModel.h"
#import "../Model/HealthModel.h"
#import "../Model/HealthInformationModel.h"

@interface MainViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UserModel *modelUser;
@property (strong, nonatomic) FootprintModel *modelFootPrint;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) StickerModel *modelSticker;
@property (strong, nonatomic) EmoticonModel *modelEmoticon;
@property (strong, nonatomic) PhotoModel *modelPhoto;
@property (strong, nonatomic) HealthModel *modelHealth;
@property (strong, nonatomic) HealthInformationModel *modelHealthInfo;

@end

