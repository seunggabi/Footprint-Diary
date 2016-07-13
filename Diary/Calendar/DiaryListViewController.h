//
//  DiaryListViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaryModel.h"
#import "DiaryViewController.h"
#import "DiaryEditViewController.h"
#import "HelperTool.h"

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
@property (strong, nonatomic) IBOutlet UIView *datePickerScreen;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

-(IBAction)showDiaryList:(UIButton *)sender;
-(IBAction)touchDate:(id)sender;

-(NSMutableArray *)loadDiaryListData:(NSString *)sDate endDate:(NSString *)eDate;

@end
