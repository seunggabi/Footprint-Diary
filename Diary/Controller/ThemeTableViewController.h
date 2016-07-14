//
//  ThemeTableViewController.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 15..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeModel.h"
#import "UserModel.h"

@interface ThemeTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) ThemeModel *modelTheme;
@property (strong, nonatomic) NSMutableArray<Theme *> *themeList;
@property (strong, nonatomic) UserModel *modelUser;
@property (strong, nonatomic) User *user;

@end
