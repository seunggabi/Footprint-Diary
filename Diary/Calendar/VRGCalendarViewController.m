//
//  VRGCalendarViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "VRGCalendarViewController.h"

@interface VRGCalendarViewController ()


@end
@implementation VRGCalendarViewController

@synthesize diary;
@synthesize emoticon;
@synthesize indexDate;
@synthesize modelDiary;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    modelDiary = [[DiaryModel alloc] init];
    [modelDiary create];
    self.calendarView.backgroundColor = [UIColor clearColor];
    VRGCalendarView *calendar = [[VRGCalendarView alloc] init];
    calendar.delegate = self;
    [self.calendarView addSubview:calendar];
}

-(Diary *)getDiary:(NSDate *)date{
    diary = [[Diary alloc] init];
    NSMutableArray *diaryModel = [modelDiary select:nil];
    NSLog(@"modelDIARY: %@", diaryModel);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *iDate = [dateFormatter stringFromDate:date];
    for(int i = 0; i<diaryModel.count; i++){
        if([[diaryModel objectAtIndex:i] d_date]== iDate){
            if([[diaryModel objectAtIndex:i] d_content])
                return diary;
        }
    }
    return nil;
}

- (void)goDiaryView:(NSDate *)date{
    
    DiaryViewController * diaryView= [[DiaryViewController alloc] initWithNibName:@"DiaryViewController" bundle:nil];
    diaryView.indexDate = date;
    [self presentViewController:diaryView animated:YES completion:nil];
}
    
- (void)goDiaryEditView:(NSDate *)date{
   
    DiaryEditViewController *editView = [[DiaryEditViewController alloc] initWithNibName:@"DiaryEditViewController" bundle:nil];
    editView.indexDate = date;
    [self presentViewController:editView animated:YES completion:nil];
}
    
-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated {
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    if (month==[components month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}

-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date {
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
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
