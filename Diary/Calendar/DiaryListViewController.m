//
//  DiaryListViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryListViewController.h"

@interface DiaryListViewController ()

@end

@implementation DiaryListViewController
@synthesize table;
@synthesize diary;
@synthesize modelDiary;
@synthesize sDateText;
@synthesize eDateText;
@synthesize datePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    sDateText.text = @"123";
    modelDiary = [[DiaryModel alloc] init];
    [modelDiary create];

    
}

-(void)changeDatePicker
{
    NSDateFormatter *dateFormat;
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM d, yyy hh:mm:ssa"];
    
    self.sDateText.text = [NSString stringWithFormat:@"%@",datePicker.date];
                           [self.sDateText resignFirstResponder];
}
                           
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [table reloadData];
}

- (IBAction)showDiaryList:(id)sender {
    [self loadDiaryListData:sDateText.text endDate:eDateText.text];
}

-(NSMutableArray *)loadDiaryListData:(NSString *)sDate endDate:(NSString *)eDate{
    diary = [[Diary alloc] init];
    NSMutableArray *diaryModel = [modelDiary select:nil];
    return diaryModel;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray * searchModel = [self loadDiaryListData:sDateText.text endDate:eDateText.text];
    return searchModel.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *diaryModel = [modelDiary select:nil];
    NSLog(@"content %@", [[diaryModel objectAtIndex:1] d_content]);

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    background.image = [UIImage imageNamed:@"cell_background.png"];
    [cell addSubview:background];
    
    UILabel *lblTitleNote = [[UILabel alloc] initWithFrame:CGRectMake(47, 7, 185, 36)];
    [lblTitleNote setFont:[UIFont boldSystemFontOfSize:13]];
    lblTitleNote.text = ((Diary *)[diaryModel objectAtIndex:indexPath.row]).d_content;
    [lblTitleNote setBackgroundColor:[UIColor clearColor]];
    [cell addSubview:lblTitleNote];
    
    //Set time string for note
    UILabel *lblDateTime = [[UILabel alloc] initWithFrame:CGRectMake(238, 7, 80, 36)];
    [lblDateTime setFont:[UIFont systemFontOfSize:13]];
    lblDateTime.text = [[diaryModel objectAtIndex:indexPath.row] d_date];
    [lblDateTime setBackgroundColor:[UIColor clearColor]];
    lblDateTime.textAlignment = UITextAlignmentRight;
    [cell addSubview:lblDateTime];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Set status can select for cell of table
    [table deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"didSelectRowAtIndexPath");
    //Get array of note
    diary = [[Diary alloc] init];
    NSMutableArray *diaryModel = [modelDiary select:nil];
    //create new view
    DiaryViewController *diaryView =  [[DiaryViewController alloc] initWithNibName:@"DiaryViewController" bundle:nil];
    NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"diary"];
    //create new view
    
    //set object of current note
    diaryView.dicArray = [dataMutableArray objectAtIndex:indexPath.row];
    diaryView.indexNumber = indexPath.row;
    //Go to new view
    [self presentViewController:diaryView animated:YES completion:nil];
}

@end
