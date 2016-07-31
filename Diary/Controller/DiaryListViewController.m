//
//  DiaryListViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryListViewController.h"
#import "DiaryViewController.h"
#import "HelperTool.h"

@interface DiaryListViewController ()

@end

@implementation DiaryListViewController

@synthesize table;
@synthesize sDateText;
@synthesize eDateText;
@synthesize selectText;
@synthesize datePicker;
@synthesize datePickerScreen;
@synthesize diaryList;
@synthesize weatherList;
@synthesize emoticonList;
@synthesize modelDiary;
@synthesize diary;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    modelDiary = [[DiaryModel alloc] init];
    [self loadDiaryListData:sDateText.text endDate:sDateText.text];
    
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.date = [NSDate date];
    [datePicker addTarget:self action:@selector(changeDatePicker)forControlEvents:UIControlEventValueChanged];
    datePickerScreen.hidden = YES;
    
    sDateText.delegate = self;
    eDateText.delegate = self;
}
                           
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadDiaryListData:sDateText.text endDate:sDateText.text];
    [table reloadData];
}

- (void)loadDiaryListData:(NSString *)sDate endDate:(NSString *)eDate {
    if([sDate isEqualToString:@""] && [eDate isEqualToString:@""])
        diaryList = [modelDiary select:@"1=1 ORDER BY d_date DESC"];
    else {
        if([sDate isEqualToString:@""])
            sDate = @"1970-01-01";
        else if([eDate isEqualToString:@""])
            eDate = [[HelperTool getInstance] getToday];
        diaryList = [modelDiary getTermList:sDate eDate:eDate];
    }
}

- (void)changeDatePicker{
    selectText.text = [[HelperTool getInstance] dateToString:datePicker.date];
}

- (IBAction)showDiaryList:(id)sender {
    [self loadDiaryListData:sDateText.text endDate:eDateText.text];
    datePickerScreen.hidden = YES;
    [selectText endEditing:YES];
    [table reloadData];
}

- (IBAction)touchDate:(id)sender {
    datePickerScreen.hidden = NO;
    selectText = sender;
    if(![selectText.text isEqualToString:@""])
        [datePicker setDate:[[HelperTool getInstance] stringToDate:selectText.text]];
    selectText.text = [[HelperTool getInstance] dateToString:datePicker.date];
    [selectText endEditing:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.diaryList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    Diary *d = [diaryList objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"[%@]", d.d_date];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", d.d_title];
    cell.detailTextLabel.textColor = [UIColor blueColor];
    cell.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [table deselectRowAtIndexPath:indexPath animated:YES];
    diary = [diaryList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ListDiaryView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ListDiaryView"]){
        DiaryViewController *diaryViewController = segue.destinationViewController;
        diaryViewController.diary = diary;
    }
}

@end
