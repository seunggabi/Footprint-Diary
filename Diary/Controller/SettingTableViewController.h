//
//  SettingTableViewController.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 14..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface SettingTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UISwitch *lockButton;
@property (strong, nonatomic) UserModel *modelUser;

@end
