//
//  VRGCalendarViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"
#import "Emoticon.h"
#import "VRGCalendarView.h"

@interface VRGCalendarViewController : UIViewController<VRGCalendarViewDelegate>{
    
}

@property (weak, nonatomic) IBOutlet VRGCalendarView *calendarView;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) Emoticon *emoticon;

-(Diary *)getDiary:(NSDate *)date;
@end
