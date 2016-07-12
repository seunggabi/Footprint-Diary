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

@interface DiaryViewController : UIViewController{
    
}

@property int indexNumber;
@property (retain, nonatomic) IBOutlet NSDictionary *dicArray;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (assign, nonatomic) NSDate *indexDate;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) NSMutableArray *photo;
@property (strong, nonatomic) NSMutableArray *emoticon;
@property (strong, nonatomic) NSMutableArray *sticker;
@property (weak, nonatomic) IBOutlet UITextField *title;
@property (retain, nonatomic) IBOutlet UITextView *content;
@property (strong, nonatomic) IBOutlet UIImageView *pImageView;

-(void)loadDiaryData:(NSString *)date;
-(void)showDiary;
-(void)delete:(NSString *)date;

@end
