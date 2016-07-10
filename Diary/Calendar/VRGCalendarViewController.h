//
//  VRGCalendarViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Model/Diary.h"
#import "../Model/DiaryModel.h"
#import "Emoticon.h"
#import "VRGCalendarView.h"
#import "DiaryViewController.h"
#import "DiaryEditViewController.h"

@interface VRGCalendarViewController : UIViewController<VRGCalendarViewDelegate>{
    
}
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) NSDate *indexDate;
@property (strong, nonatomic) DiaryModel *modelDiary;
@property (weak, nonatomic) IBOutlet VRGCalendarView *calendarView;
@property (strong, nonatomic) Emoticon *emoticon;

-(Diary *)getDiary:(NSDate *)date;
@end
