//
//  DiaryListViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diary.h"
#import "DiaryModel.h"
#import "DiaryViewController.h"
#import "DiaryEditViewController.h"

@interface DiaryListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate >{
}

@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) DiaryModel *modelDiary;

@property (strong, nonatomic) NSMutableArray *diaryList;
@property (strong, nonatomic) NSMutableArray *stickerList;

@property (strong, nonatomic) IBOutlet UITextField *sDateText;
@property (strong, nonatomic) IBOutlet UITextField *eDateText;
@property (strong, nonatomic) IBOutlet UITextField *tempText;

@property (retain, nonatomic) IBOutlet UITableView  *table;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *showDiaryList;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

-(IBAction)showDiaryList:(UIButton *)sender;
-(IBAction)touchSDate:(id)sender;
-(IBAction)touchEDate:(id)sender;

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField;

-(NSMutableArray *)loadDiaryListData:(NSString *)sDate endDate:(NSString *)eDate;


@end
