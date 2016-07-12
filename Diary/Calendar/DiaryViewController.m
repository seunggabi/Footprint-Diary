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
@synthesize selectedDiary;
@synthesize dicArray;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    modelDiary = [[DiaryModel alloc] init];
    [modelDiary create];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *iDate = [dateFormatter stringFromDate:indexDate];
    [self loadDiaryData:iDate];
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{    
    [textField resignFirstResponder];
    return NO;
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadDiaryData:(NSString *)date{
    selectedDiary = [[Diary alloc] init];
    title.text = selectedDiary.d_title;
    content.text = selectedDiary.d_content;
    content.editable = FALSE;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}

-(IBAction)delete:(id)sender {
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

-(IBAction)changeDiary:(id)sender {
    [self goDiaryEditView:selectedDiary];
}

-(void)goDiaryEditView:(Diary *)diary{
    DiaryEditViewController *editView = [[DiaryEditViewController alloc] initWithNibName:@"DiaryEditViewController" bundle:nil];
    editView.indexDate = diary.d_time;
    [self presentViewController:editView animated:YES completion:nil];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
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
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
