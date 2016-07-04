//
//  SettingTableViewController.h
//  Diary
//
//  Created by PC GUARD on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewController : UITableViewController<UITableViewDataSource,
UITableViewDelegate>
{
    IBOutlet UITableView *SettingTableView;
    NSMutableArray *mySetting;
}
@property (strong, nonatomic) IBOutlet UITableView *SettingTableViewController;

@end
