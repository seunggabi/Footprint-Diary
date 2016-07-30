//
//  PasswordSettingViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 28..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "PasswordSettingViewController.h"

@interface PasswordSettingViewController ()

@end

@implementation PasswordSettingViewController

@synthesize pwText_1;
@synthesize pwText_2;
@synthesize pwText_3;
@synthesize pwText_4;
@synthesize button_1;
@synthesize button_2;
@synthesize button_3;
@synthesize button_4;
@synthesize button_5;
@synthesize button_6;
@synthesize button_7;
@synthesize button_8;
@synthesize button_9;
@synthesize button_0;
@synthesize buttonErase;
@synthesize pw;
@synthesize pwCheck;
@synthesize pwCheckMessage;
@synthesize pwTextArray;
@synthesize modelUser;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pw = @"";
    pwCheck = @"";
    pwTextArray = [[NSMutableArray alloc] init];
    [pwTextArray addObject:pwText_1];
    [pwTextArray addObject:pwText_2];
    [pwTextArray addObject:pwText_3];
    [pwTextArray addObject:pwText_4];
    
    modelUser = [[UserModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)touchBtn:(id)sender {
    int targetLength = 0;
    if(pw.length < 4) {
        pwCheckMessage.text = @"비밀번호를 입력해주세요.";
        pwCheckMessage.textColor = [UIColor blackColor];
        if(sender == buttonErase)
            pw = [pw substringToIndex:pw.length-1];
        else
            pw = [pw stringByAppendingString:((UIButton *)sender).titleLabel.text];
        targetLength = (int)pw.length;
        if(targetLength == 4) {
            targetLength = 0;
            pwCheckMessage.text = @"비밀번호를 다시 입력해주세요.";
        }
    } else if(pwCheck.length < 4) {
        if(sender == buttonErase)
            pwCheck = [pwCheck substringToIndex:pwCheck.length-1];
        else
            pwCheck = [pwCheck stringByAppendingString:((UIButton *)sender).titleLabel.text];
        targetLength = (int)pwCheck.length;
    }
    if(pw.length == 4 && pwCheck.length == 4){
        if([pw isEqualToString:pwCheck]) {
            User *u = [modelUser select];
            u.u_password = pw;
            [modelUser insertData:u];
            NSLog(@"Success");
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            pw = @"";
            pwCheck = @"";
            targetLength = 0;
            pwCheckMessage.text = @"비밀번호가 서로 일치하지 않습니다.";
            pwCheckMessage.textColor = [UIColor redColor];
            NSLog(@"Fail");
        }
    }
    for(int i=0; i<4; i++) {
        NSString *str = @"";
        if(i<targetLength)
            str = @"*";
        pwTextArray[i].text = str;
    }
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
