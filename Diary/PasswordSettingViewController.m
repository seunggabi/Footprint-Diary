//
//  PasswordSettingViewController.m
//  Diary
//
//  Created by MyMac on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "PasswordSettingViewController.h"

@interface PasswordSettingViewController ()

@end

@implementation PasswordSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 현재 ‘비밀번호’와 ‘비밀번호 확인’을 입력해주고 설정된 비밀번호와  일치하는지 확인해주는 메소드
- (BOOL)passwordCheck {
    return nil;
}

// 사용자가 답변해야할 질문을 보여주고 답변내용의 진위를 확인해주는 메소드
- (BOOL)questionCheck {
    return nil;
}

// 비밀번호 설정과정을 제대로 수행하였을경우 PasswordChangeViewController를 호출해주는 메소드
- (void)callPasswordChange {
    
}

// 비밀번호 설정을 취소하는 메소드
- (void)cancle {

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
