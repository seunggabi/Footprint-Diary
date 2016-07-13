//
//  VRGCalendarView.h
//  Vurig
//
//  Created by in 't Veen Tjeerd on 5/8/12.
//  Copyright (c) 2012 Vurig Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+expanded.h"
#import "DiaryModel.h"

#define kVRGCalendarViewTopBarHeight 60
#define kVRGCalendarViewWidth 320
#define kVRGCalendarViewDayWidth 44
#define kVRGCalendarViewDayHeight 55

@protocol CalendarViewDelegate;

@interface CalendarView : UIView {
    BOOL isAnimating;
    BOOL prepAnimationPreviousMonth;
    BOOL prepAnimationNextMonth;
}

@property (nonatomic, retain) id <CalendarViewDelegate> delegate;
@property (nonatomic, retain) NSDate *currentMonth;
@property (nonatomic, retain) UILabel *labelCurrentMonth;
@property (nonatomic, retain) NSArray *markedDates;
@property (nonatomic, retain) NSArray *markedColors;
@property (nonatomic, retain) NSArray *markedDiarys;
@property (nonatomic, retain) UIImageView *animationView_A;
@property (nonatomic, retain) UIImageView *animationView_B;
@property (nonatomic, getter = calendarHeight) float calendarHeight;
@property (nonatomic, retain, getter = selectedDate) NSDate *selectedDate;
@property (nonatomic, strong) NSMutableArray *diaryList;

-(void) selectDate:(int)date;
-(void) reset;
-(void) markDates:(NSArray *)dates;
-(void) markDates:(NSArray *)dates withColors:(NSArray *)colors;
-(void) showNextMonth;
-(void) showPreviousMonth;
-(int) numRows;
-(void) updateSize;
-(UIImage *)drawCurrentState;

@end

@protocol CalendarViewDelegate <NSObject>
-(void) calendarView:(CalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated;
-(void) calendarView:(CalendarView *)calendarView dateSelected:(NSDate *)date;

@end
