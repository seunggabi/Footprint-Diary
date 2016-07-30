//
//  LockViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 30..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "LockViewController.h"

@interface LockViewController ()

@end

@implementation LockViewController

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
@synthesize pwCheckMessage;
@synthesize pwTextArray;
@synthesize modelUser;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pw = @"";
    pwTextArray = [[NSMutableArray alloc] init];
    [pwTextArray addObject:pwText_1];
    [pwTextArray addObject:pwText_2];
    [pwTextArray addObject:pwText_3];
    [pwTextArray addObject:pwText_4];
    
    modelUser = [[UserModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchBtn:(id)sender {
    if(pw.length < 4) {
        pwCheckMessage.text = @"비밀번호를 입력해주세요.";
        pwCheckMessage.textColor = [UIColor blackColor];
        if(sender == buttonErase)
            pw = [pw substringToIndex:pw.length-1];
        else
            pw = [pw stringByAppendingString:((UIButton *)sender).titleLabel.text];
    }
    if(pw.length == 4){
        User *u = [modelUser select];
        NSLog(@"%@", [u getObj]);
        NSLog(@"%@", pw);
        if([pw isEqualToString:u.u_password]) {
            NSLog(@"Success");
            [self performSegueWithIdentifier:@"Unlock" sender:nil];
        } else {
            pw = @"";
            pwCheckMessage.text = @"저장되어 있는 비밀번호와 달라요.";
            pwCheckMessage.textColor = [UIColor redColor];
            NSLog(@"Fail");
        }
    }
    for(int i=0; i<4; i++) {
        NSString *str = @"";
        if(i<pw.length)
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
