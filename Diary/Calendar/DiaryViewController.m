//
//  DiaryInquiryViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryViewController.h"

@interface DiaryViewController ()

@end

@implementation DiaryViewController
@synthesize indexDate;
@synthesize indexNumber;
@synthesize modelDiary;
@synthesize title;
@synthesize content;
@synthesize pImageView;
@synthesize diary;
@synthesize dicArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)back:(UIButton *)sender{
    //Using method dissmissModel View for back to last view
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    modelDiary = [[DiaryModel alloc] init];
    [modelDiary create];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *iDate = [dateFormatter stringFromDate:indexDate];
    [self loadDiaryData:iDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)loadDiaryData:(NSString *)date{
    diary = [[Diary alloc] init];
    NSMutableArray *diaryModel = [modelDiary select:nil];
    title.text = [dicArray objectForKey:@"title"];
    content.text = [dicArray objectForKey:@"content"];
    content.editable = FALSE;
}
- (IBAction)delete:(id)sender {
    //Call alert view for notice user delete note
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Noctice"
                                                    message:@"Do you want to delete this file?"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:@"Cancel",nil];
    //Set tag for alert
    alert.tag = 1;
    [alert show];
}

- (IBAction)changeDiary:(id)sender {
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1) {
        if(buttonIndex != 1) {//Same alert for delete note
            NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"diary"];
            //Remove object contain current note from array
            [dataMutableArray removeObjectAtIndex:indexNumber];
            //Back to main view
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

@end
