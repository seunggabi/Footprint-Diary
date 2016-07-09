//
//  DiaryWriteViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"
#import "Emoticon.h"
#import "Photo.h"
#import "Sticker.h"

@interface DiaryEditViewController : UIViewController
@property (strong, nonatomic) Emoticon *emoticon;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) Sticker *sticker;

-(void)writeDiary;
-(void)delete:(NSDate *)date;
-(IBAction)goEmoticon:(id)sender;
@end
