//
//  CalendarViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()


@end
@implementation CalendarViewController

@synthesize diary;
@synthesize emoticon;
@synthesize indexDate;
@synthesize modelDiary;

- (void)viewDidLoad
{
    [super viewDidLoad];
    modelDiary = [[DiaryModel alloc] init];
    self.calendarView.backgroundColor = [UIColor clearColor];
    CalendarView *calendar = [[CalendarView alloc] init];
    calendar.delegate = self;
    calendar.diaryList = [modelDiary select:nil];
    [self.calendarView addSubview:calendar];
}

-(Diary *)getDiary:(NSDate *)date{
    diary = [[Diary alloc] init];
    NSMutableArray *diaryList = [modelDiary select:nil];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *iDate = [dateFormatter stringFromDate:date];
    for(int i = 0; i<diaryList.count; i++){
        if([((Diary *)[diaryList objectAtIndex:i]).d_date isEqualToString:iDate]){
            if(((Diary *)[diaryList objectAtIndex:i]).d_content)
                return diary;
        }
    }
    return nil;
}

- (void)goDiaryView:(NSDate *)date{
    DiaryViewController *diaryView = [[DiaryViewController alloc] initWithNibName:@"DiaryViewController" bundle:nil];
    diaryView.indexDate = date;
    [self presentViewController:diaryView animated:YES completion:nil];
}
    
- (void)goDiaryEditView:(NSDate *)date{
    DiaryEditViewController *editView = [[DiaryEditViewController alloc] initWithNibName:@"DiaryEditViewController" bundle:nil];
    editView.indexDate = date;
    [self presentViewController:editView animated:YES completion:nil];
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
    if(diary){
        [self goDiaryView:date];
    }else{
        [self goDiaryEditView:date];
    }
    NSLog(@"Selected date = %@",date);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end