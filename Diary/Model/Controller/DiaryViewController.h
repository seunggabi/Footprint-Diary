//
//  DiaryViewController.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 13..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <DaumMap/MTMapView.h>
#import "ViewController.h"
#import "DiaryModel.h"
#import "FootprintModel.h"
#import "StickerModel.h"
#import "EmoticonModel.h"
#import "WeatherModel.h"
#import "PhotoModel.h"
#import "HealthModel.h"

@interface DiaryViewController : ViewController <MTMapViewDelegate>

@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) FootprintModel *modelFootprint;
@property (strong, nonatomic) StickerModel *modelSticker;
@property (strong, nonatomic) EmoticonModel *modelEmoticon;
@property (strong, nonatomic) WeatherModel *modelWeather;
@property (strong, nonatomic) PhotoModel *modelPhoto;
@property (strong, nonatomic) HealthModel *modelHealth;

@property (weak, nonatomic) IBOutlet UIView *mapScreen;
@property (strong, nonatomic) MTMapView *mapView;

@property (strong, nonatomic) NSMutableArray *mapPointList;
@property (strong, nonatomic) MTMapPolyline *mapPolyLine;
@property (strong, nonatomic) Diary *diary;

@end
