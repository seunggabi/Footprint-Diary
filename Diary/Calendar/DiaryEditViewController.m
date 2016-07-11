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
    modelDiary = [[DiaryModel alloc] init];
    [modelDiary create];
    modelPhoto = [[PhotoModel alloc] init];
    [modelPhoto create];
    modelSticker = [[StickerModel alloc] init];
    [modelSticker create];
    modelEmoticon = [[EmoticonModel alloc] init];
    [modelEmoticon create];
    
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
        Photo *photo = [[Photo alloc] init];
        Diary *diary = [[Diary alloc] init];
        photo.p_src = pImageView ;
        diary.d_time = indexDate;
        //Disable Keyboard
        [content resignFirstResponder];
        //Set Frame of textview when edit note
        [content setFrame:CGRectMake(0, 77, 319, 381)];
        NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"diary"];
        // get current date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyy-MM-dd"];
        NSString *iDate = [dateFormatter stringFromDate:indexDate];
        NSString *dateTitle = title.text;
        //Save new content, date, title of Note to new index of array.
        [dataMutableArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:dateTitle,@"title",indexDate,@"date",content.text,@"content", nil]];
        //Back to main view
        [self dismissViewControllerAnimated:YES completion:nil];
       
        NSString *diaryTitle = title.text;
        photo.p_date = iDate;
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
