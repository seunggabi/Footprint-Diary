//
//  DiaryWriteViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryEditViewController.h"

@interface DiaryEditViewController ()

@end

@implementation DiaryEditViewController
@synthesize pImageView;
@synthesize originImage;
@synthesize title;
@synthesize content;
@synthesize indexDate;
@synthesize modelDiary;
@synthesize modelPhoto;
@synthesize modelSticker;
@synthesize modelEmoticon;

- (void)viewDidLoad {
    [super viewDidLoad];
    originImage = [UIImage imageNamed:@"default.png"];
    [pImageView setImage:originImage];
    [modelDiary create];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)runGeneralPicker{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)finishedPicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info{
    originImage = nil;
    originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self finishedPicker];
    [pImageView setImage:originImage];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self finishedPicker];
}

-(IBAction)writeDiary{
    if ([title.text length]!=0) {//Title is  existed
        Diary *diary = [[Diary alloc] init];
        diary.d_time = indexDate;
        //Disable Keyboard
        [content resignFirstResponder];
        //Set Frame of textview when edit note
        [content setFrame:CGRectMake(0, 77, 319, 381)];

        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyy-MM-dd"];
        NSString *iDate = [dateFormatter stringFromDate:indexDate];
        NSString *diaryTitle = title.text;
        diary.d_date = iDate;
        diary.d_title = diaryTitle;
        diary.d_content = content.text;
        diary.d_e_id = @0;
        diary.d_weather = @0;
        [modelDiary insertData:diary];
        //Back to main view
        NSLog(@"content %@", diary.d_content );
        NSLog(@"modelDiary %@", diary);
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else//Title is not existed
    {
        //Call alert view for notice user add title note
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Noctice"
                                                        message:@"You must type your note title!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
-(IBAction)goEmoticon:(id)sender{
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
