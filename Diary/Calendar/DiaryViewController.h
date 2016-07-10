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

@interface DiaryViewController : UIViewController

@property (assign, nonatomic) NSDate *indexDate;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) NSMutableArray *photo;
@property (strong, nonatomic) NSMutableArray *emoticon;
@property (strong, nonatomic) NSMutableArray *sticker;

-(void)loadDiaryData:(NSString *)date;
-(void)showDiary;
-(void)delete:(NSString *)date;

@end
