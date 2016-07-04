//
//  ViewController.h
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "DBConnector.h"

@interface MainViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DBConnector* dbConnector;
@property (strong, nonatomic) UserModel* modelUser;

@end

