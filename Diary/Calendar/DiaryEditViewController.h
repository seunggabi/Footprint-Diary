//
//  DiaryWriteViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"
#import "Emoticon.h"
#import "Photo.h"
#import "Sticker.h"
#import "DiaryModel.h"
#import "StickerModel.h"
#import "EmoticonModel.h"
#import "PhotoModel.h"
#import "WeatherModel.h"

@interface DiaryEditViewController : UIViewController

@property (strong, nonatomic) UIImage *originImage;
@property (strong, nonatomic) NSDate *indexDate;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) StickerModel *modelSticker;
@property (strong, nonatomic) EmoticonModel *modelEmoticon;
@property (strong, nonatomic) PhotoModel *modelPhoto;
@property (strong, nonatomic) WeatherModel *modelWeather;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) Emoticon *emoticon;
@property (strong, nonatomic) Sticker *sticker;
@property (retain, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIImageView *pImageView;
@property (retain, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UITextField *title;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (strong, nonatomic) IBOutlet UIButton *radioButton1;
@property (strong, nonatomic) IBOutlet UIButton *radioButton2;
@property (strong, nonatomic) IBOutlet UIButton *radioButton3;
@property (strong, nonatomic) IBOutlet UIButton *radioButton4;

-(IBAction)runGeneralPicker;
-(IBAction)writeDiary;
-(IBAction)goEmoticon:(id)sender;

@end
