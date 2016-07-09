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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calendarView.backgroundColor = [UIColor clearColor];
    VRGCalendarView *calendar = [[VRGCalendarView alloc] init];
    calendar.delegate = self;
    [self.calendarView addSubview:calendar];
}
//-(Diary *)getDiary:(NSDate *)date{
//    // diary =
//}

-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated {
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    if (month==[components month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}
//- (IBAction)goDetail:(id)sender{
//    DetailView * detail = [[DetailView alloc] initWithNibName:@"DetailView" bundle:nil];
//    detail.indexDay = [sender tag];
//    NSLog(@"INDEX DAY : %d", [sender tag]);
//    [self presentViewController:detail animated:YES completion:nil];
//}
-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date {
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
