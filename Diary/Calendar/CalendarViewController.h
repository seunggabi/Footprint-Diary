//
//  CalendarViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"
#import "DiaryModel.h"
#import "Emoticon.h"
#import "CalendarView.h"
#import "DiaryViewController.h"
#import "DiaryEditViewController.h"

@interface CalendarViewController : UIViewController<CalendarViewDelegate>{
    
}
@property (strong, nonatomic) NSDate *indexDate;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) Emoticon *emoticon;

@property (weak, nonatomic) IBOutlet CalendarView *calendarView;

-(Diary *)getDiary:(NSDate *)date;
@end
