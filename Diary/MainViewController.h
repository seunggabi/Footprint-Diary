//
//  ViewController.h
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <sqlite3.h>
#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface MainViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource> {
    sqlite3 *db;
}

@property (strong, nonatomic) UserModel* modelUser;

-(NSString *) filePath;
-(void) openDB;

@end

