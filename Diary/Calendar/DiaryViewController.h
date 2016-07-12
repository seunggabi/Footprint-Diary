//
//  DiaryInquiryViewController.h
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
#import "DiaryEditViewController.h"

@interface DiaryViewController : UIViewController<UITextFieldDelegate>{
    
}

@property int indexNumber;
@property (assign, nonatomic) NSDate *indexDate;

@property (strong, nonatomic) Diary *selectedDiary;
@property (strong, nonatomic) DiaryModel *modelDiary;

@property (strong, nonatomic) NSMutableArray *photo;
@property (strong, nonatomic) NSMutableArray *emoticon;
@property (strong, nonatomic) NSMutableArray *sticker;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *delete;
@property (weak, nonatomic) IBOutlet UIButton *changeDiary;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (retain, nonatomic) IBOutlet NSDictionary *dicArray;
@property (strong, nonatomic) IBOutlet UIImageView *pImageView;

-(void)loadDiaryData:(NSString *)date;
-(void)delete:(NSString *)date;

@end
