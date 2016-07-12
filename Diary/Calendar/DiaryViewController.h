//
//  DiaryInquiryViewController.h
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
#import "DiaryEditViewController.h"

@interface DiaryViewController : UIViewController<UITextFieldDelegate>{
    
}

@property int indexNumber;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) Diary *selectedDiary;
@property (assign, nonatomic) NSDate *indexDate;
@property (strong, nonatomic) NSMutableArray *photo;
@property (strong, nonatomic) NSMutableArray *emoticon;
@property (strong, nonatomic) NSMutableArray *sticker;

@property (strong, nonatomic) IBOutlet UIImageView *pImageView;
@property (weak, nonatomic) IBOutlet UIButton *changeDiary;
@property (weak, nonatomic) IBOutlet UIButton *delete;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (retain, nonatomic) IBOutlet NSDictionary *dicArray;

-(void)loadDiaryData:(NSString *)date;
-(void)delete:(NSString *)date;

@end
