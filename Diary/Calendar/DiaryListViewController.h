//
//  DairyListViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Model/Diary.h"
#import "../Model/DiaryModel.h"
#import "DiaryViewController.h"
#import "DiaryEditViewController.h"

@interface DiaryListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate >
{
    
}
@property (strong, nonatomic) IBOutlet UITextField *sDateText;
@property (strong, nonatomic) IBOutlet UITextField *eDateText;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *showDiaryList;

@property (strong, nonatomic) DiaryModel *modelDiary;
@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) NSString *startDate;
@property (strong, nonatomic) NSString *endDate;
@property (strong, nonatomic) NSMutableArray *diaryList;
@property (strong, nonatomic) NSMutableArray *sticker;
@property (retain, nonatomic) IBOutlet UITableView  *table;

- (IBAction)goDiaryView:(UIButton *)sender;
-(NSMutableArray *)loadDiaryListData:(NSString *)sDate endDate:(NSString *)eDate;


@end
