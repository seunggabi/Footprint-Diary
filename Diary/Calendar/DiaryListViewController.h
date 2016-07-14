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
#import "HelperTool.h"

@interface DiaryListViewController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>{
}
@property (strong, nonatomic) IBOutlet UITextField *sDateText;
@property (strong, nonatomic) IBOutlet UITextField *eDateText;
@property (strong, nonatomic) IBOutlet UITextField *selectText;

@property (retain, nonatomic) IBOutlet UITableView  *table;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *showDiaryList;
@property (strong, nonatomic) IBOutlet UIView *datePickerScreen;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIView *cell;
@property (strong, nonatomic) IBOutlet UILabel *titleText;

@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) NSMutableArray *diaryList;
@property (strong, nonatomic) NSMutableArray *weatherList;
@property (strong, nonatomic) NSMutableArray *emoticonList;
@property (strong, nonatomic) Diary *diary;

-(IBAction) showDiaryList:(UIButton *)sender;
-(IBAction) touchDate:(id)sender;
-(void) changeDatePicker;

-(void)loadDiaryListData:(NSString *)sDate endDate:(NSString *)eDate;

@end
