//
//  PasswordSettingViewController.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 28..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface PasswordSettingViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *pwText_1;
@property (strong, nonatomic) IBOutlet UILabel *pwText_2;
@property (strong, nonatomic) IBOutlet UILabel *pwText_3;
@property (strong, nonatomic) IBOutlet UILabel *pwText_4;
@property (strong, nonatomic) IBOutlet UIButton *button_1;
@property (strong, nonatomic) IBOutlet UIButton *button_2;
@property (strong, nonatomic) IBOutlet UIButton *button_3;
@property (strong, nonatomic) IBOutlet UIButton *button_4;
@property (strong, nonatomic) IBOutlet UIButton *button_5;
@property (strong, nonatomic) IBOutlet UIButton *button_6;
@property (strong, nonatomic) IBOutlet UIButton *button_7;
@property (strong, nonatomic) IBOutlet UIButton *button_8;
@property (strong, nonatomic) IBOutlet UIButton *button_9;
@property (strong, nonatomic) IBOutlet UIButton *button_0;
@property (strong, nonatomic) IBOutlet UIButton *buttonErase;
@property (strong, nonatomic) NSString *pw;
@property (strong, nonatomic) NSString *pwCheck;
@property (strong, nonatomic) NSMutableArray<UILabel*> *pwTextArray;
@property (strong, nonatomic) IBOutlet UILabel *pwCheckMessage;
@property (strong, nonatomic) UserModel *modelUser;

- (IBAction)touchBtn:(id)sender;

@end
