//
//  DiaryWriteViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Model/Diary.h"
#import "../Model/Emoticon.h"
#import "../Model/Photo.h"
#import "../Model/Sticker.h"
#import "../Model/DiaryModel.h"
#import "../Model/StickerModel.h"
#import "../Model/EmoticonModel.h"
#import "../Model/PhotoModel.h"

@interface DiaryEditViewController : UIViewController

@property (strong, nonatomic) NSDate *indexDate;
@property (retain, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIImageView *pImageView;
@property (strong, nonatomic) UIImage *originImage;
@property (retain, nonatomic) IBOutlet UITextView *content;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) StickerModel *modelSticker;
@property (strong, nonatomic) EmoticonModel *modelEmoticon;
@property (strong, nonatomic) PhotoModel *modelPhoto;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) Emoticon *emoticon;
@property (strong, nonatomic) Sticker *sticker;
@property (weak, nonatomic) IBOutlet UITextField *title;

-(IBAction)runGeneralPicker;
-(IBAction)writeDiary;
-(IBAction)goEmoticon:(id)sender;

@end
