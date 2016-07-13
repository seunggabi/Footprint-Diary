//
//  DiaryWriteViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryEditViewController.h"
#import "EmoticonViewController.h"

@interface DiaryEditViewController ()

@end

@implementation DiaryEditViewController

@synthesize pImageView;
@synthesize originImage;
@synthesize title;
@synthesize content;
@synthesize indexDate;
@synthesize radioButton1, radioButton2, radioButton3, radioButton4;
@synthesize modelDiary, modelPhoto, modelSticker, modelEmoticon, modelWeather;

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
    modelWeather = [[WeatherModel alloc] init];
    [modelWeather create];
    
    [radioButton1 setImage:[UIImage imageNamed:@"radioButtonOn.png"] forState:UIControlStateSelected];
    radioButton1.layer.cornerRadius=22;
    radioButton1.layer.masksToBounds=YES;
    radioButton1.tag = 1;
    [radioButton1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [radioButton2 setImage:[UIImage imageNamed:@"radioButtonOn.png"] forState:UIControlStateSelected];
    radioButton2.layer.cornerRadius=22;
    radioButton2.layer.masksToBounds=YES;
    radioButton2.tag = 2;
    [radioButton2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [radioButton3 setImage:[UIImage imageNamed:@"radioButtonOn.png"] forState:UIControlStateSelected];
    radioButton3.layer.cornerRadius=22;
    radioButton3.layer.masksToBounds=YES;
    radioButton3.tag = 3;
    [radioButton3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [radioButton4 setImage:[UIImage imageNamed:@"radioButtonOn.png"] forState:UIControlStateSelected];
    radioButton4.layer.cornerRadius=22;
    radioButton4.layer.masksToBounds=YES;
    radioButton4.tag = 4;
    [radioButton4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    if ([title.text length]!=0) {
        Photo *photo = [[Photo alloc] init];
        Diary *diary = [[Diary alloc] init];
        Weather *weather = [[Weather alloc] init];
        
        [content resignFirstResponder];
        [content setFrame:CGRectMake(0, 77, 319, 381)];
 
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyy-MM-dd"];
        NSString *iDate = [dateFormatter stringFromDate:indexDate];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        photo.p_date = iDate;
        
        diary.d_time = indexDate;
        diary.d_date = iDate;
        diary.d_title = title.text;
        diary.d_content = content.text;
        diary.d_e_id = @0;
        diary.d_w_id = @0;
        
        [modelDiary insertData:diary];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Noctice"
                                                        message:@"You must type your note title!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void)buttonClicked:(UIButton *)sender{
    switch(sender.tag)
    {
        case 1:
            if([radioButton1 isSelected] == YES){
                [radioButton1 setSelected:NO];
            }else{
                [radioButton1 setSelected:YES];
                [radioButton2 setSelected:NO];
                [radioButton3 setSelected:NO];
                [radioButton4 setSelected:NO];
                //수정할 것 집어넣기
            }
            break;
        case 2:
            if([radioButton2 isSelected] == YES){
                [radioButton2 setSelected:NO];
            }else{
                [radioButton2 setSelected:YES];
                [radioButton1 setSelected:NO];
                [radioButton3 setSelected:NO];
                [radioButton4 setSelected:NO];
            }
            break;
        case 3:
            if([radioButton3 isSelected] == YES){
                [radioButton3 setSelected:NO];
            }else{
                [radioButton3 setSelected:YES];
                [radioButton1 setSelected:NO];
                [radioButton2 setSelected:NO];
                [radioButton4 setSelected:NO];
            }
            break;
        case 4:
            if([radioButton4 isSelected] == YES){
                [radioButton4 setSelected:NO];
            }else{
                [radioButton4 setSelected:YES];
                [radioButton1 setSelected:NO];
                [radioButton2 setSelected:NO];
                [radioButton3 setSelected:NO];
            }
            break;
    } 
} 

-(IBAction)goEmoticon:(id)sender{
    EmoticonViewController *emoticonView = [[EmoticonViewController alloc] initWithNibName:@"EmoticonViewController" bundle:nil];
    emoticonView.emoticonList = [modelEmoticon select:nil];
    [self presentViewController:emoticonView animated:YES completion:nil];
}

@end
