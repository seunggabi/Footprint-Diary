//
//  CalendarViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "CalendarViewController.h"
#import "HelperTool.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

@synthesize diary;
@synthesize diaryList;
@synthesize emoticon;
@synthesize indexDate;
@synthesize modelDiary;
@synthesize calendar;

-(void) viewDidLoad{
    [super viewDidLoad];
    modelDiary = [[DiaryModel alloc] init];
    calendar = [[CalendarView alloc] init];
    calendar.delegate = self;
    calendar.diaryList = diaryList = [modelDiary select:nil];
    [self.calendarScreen addSubview:calendar];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    calendar.diaryList = [modelDiary select:nil];
    [self.calendarScreen setNeedsDisplay];
}

-(Diary *) getDiary:(NSDate *)date{
    NSString *selectDay = [[HelperTool getInstance] dateToString:date];
    for(int i = 0; i<diaryList.count; i++){
        diary = [diaryList objectAtIndex:i];
        if([diary.d_date isEqualToString:selectDay]){
            return diary;
        }
    }
    return nil;
}

-(void)calendarView:(CalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated {
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    if (month==[components month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}

-(void)calendarView:(CalendarView *)calendarView dateSelected:(NSDate *)date {
    diary = [self getDiary:date];
    if(diary == nil) {
        diary = [[Diary alloc] init];
        diary.d_date = [[HelperTool getInstance] dateToString:date];
        [self performSegueWithIdentifier:@"DiaryEditView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"DiaryView" sender:self];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DiaryView"]) {
        DiaryViewController *diaryViewController = segue.destinationViewController;
        diaryViewController.diary = diary;
    } else if ([segue.identifier isEqualToString:@"DiaryEditView"]) {
        DiaryViewController *diaryViewController = segue.destinationViewController;
        diaryViewController.diary = diary;
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
