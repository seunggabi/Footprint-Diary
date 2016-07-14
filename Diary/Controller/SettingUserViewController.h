//
//  SettingUserViewController.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 14..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface SettingUserViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *timerText;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (strong, nonatomic) UserModel *modelUser;
@property (strong, nonatomic) User *user;

- (IBAction)touchSave:(id)sender;

@end
