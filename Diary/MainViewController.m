//
//  ViewController.m
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "MainViewController.h"
#import "UserModel.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize dbConnector;
@synthesize modelUser;

- (void)viewDidLoad {
    dbConnector = [DBConnector alloc];
    modelUser = [UserModel alloc];
    
    [dbConnector openDB];
    [modelUser setDB:[dbConnector getDB]];
    
    [modelUser dropUser];
    [modelUser createUser];
    [modelUser setUser:[modelUser getSampleData]];
    
    NSDictionary *array = [modelUser getUser];
    NSLog(@"%@",array);
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
