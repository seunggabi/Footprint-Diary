//
//  SettingUserViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 14..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "SettingUserViewController.h"
#import "PedometerTool.h"

@interface SettingUserViewController ()

@end

@implementation SettingUserViewController

@synthesize modelUser;
@synthesize user;
@synthesize nameText;
@synthesize timerText;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    modelUser = [[UserModel alloc] init];
    user = [modelUser select];
    nameText.text = user.u_name;
    timerText.text = [user.u_timer stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)touchSave:(id)sender {
    user.u_name = nameText.text;
    user.u_timer = @([timerText.text intValue]);
    [modelUser insertData:user];
    [self.navigationController popViewControllerAnimated:YES];
    [[PedometerTool getInstance] start];
    
}
@end
