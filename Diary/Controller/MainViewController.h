//
//  ViewController.h
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Model/UserModel.h"
#import "../Model/FootprintModel.h"
#import "../Model/DBConnector.h"

@interface MainViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UserModel *modelUser;
@property (strong, nonatomic) FootprintModel *modelFootPrint;

@end

