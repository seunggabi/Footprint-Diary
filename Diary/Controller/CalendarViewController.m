//
//  CalendarViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "CalendarViewController.h"
#import "DiaryViewController.h"
#import "DiaryEditViewController.h"
#import "HelperTool.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController

@synthesize diary;
@synthesize diaryList;
@synthesize indexDate;
@synthesize modelUser;
@synthesize modelDiary;
@synthesize modelEmoticon;
@synthesize calendar;

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    Theme *themeInfo = [[HelperTool getInstance] getTheme];
    
    UIImage *backgroundImage = [UIImage imageNamed:themeInfo.th_main];
    CGSize newSize = [UIScreen mainScreen].bounds.size;
    backgroundImage = [[HelperTool getInstance] changeImageSize:backgroundImage newSize:newSize];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    modelUser = [[UserModel alloc] init];
    modelDiary = [[DiaryModel alloc] init];
    modelEmoticon = [[EmoticonModel alloc] init];
    calendar = [[CalendarView alloc] init];
    calendar.delegate = self;
    calendar.diaryList = diaryList = [modelDiary select:nil];
    [self.calendarScreen addSubview:calendar];
    self.navigationItem.title = [modelUser select].u_name;
}

- (Diary *)getDiary:(NSDate *)date{
    NSString *selectDay = [[HelperTool getInstance] dateToString:date];
    for(int i = 0; i<diaryList.count; i++){
        diary = [diaryList objectAtIndex:i];
        if([diary.d_date isEqualToString:selectDay]){
            return diary;
        }
    }
    return nil;
}

- (void)calendarView:(CalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated {
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    if (month==[components month]){
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}

- (void)calendarView:(CalendarView *)calendarView dateSelected:(NSDate *)date {
    diary = [self getDiary:date];
    if(diary == nil){
        diary = [[Diary alloc] init];
        diary.d_date = [[HelperTool getInstance] dateToString:date];
        [self performSegueWithIdentifier:@"CalendarDiaryEditView" sender:self];
    } else {
        [self performSegueWithIdentifier:@"CalendarDiaryView" sender:self];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CalendarDiaryEditView"]){
        DiaryEditViewController *diaryEditViewController = segue.destinationViewController;
        diaryEditViewController.diary = self.diary;
    } else if ([segue.identifier isEqualToString:@"CalendarDiaryView"]){
        DiaryViewController *diaryViewController = segue.destinationViewController;
        diaryViewController.diary = self.diary;
    }
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
