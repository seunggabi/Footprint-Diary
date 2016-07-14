//
//  CalendarViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "DiaryModel.h"
#import "EmoticonModel.h"
#import "CalendarView.h"

@interface CalendarViewController : UIViewController<CalendarViewDelegate>{
    
}

@property (strong, nonatomic) NSDate *indexDate;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) NSMutableArray *diaryList;
@property (strong, nonatomic) UserModel *modelUser;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) EmoticonModel *modelEmoticon;
@property (strong, nonatomic) CalendarView *calendar;
@property (weak, nonatomic) IBOutlet UIView *calendarScreen;

-(Diary *)getDiary:(NSDate *)date;

@end
