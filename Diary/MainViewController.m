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
@synthesize modelUser;

- (void)viewDidLoad {
    modelUser = [[UserModel alloc] init];
    
    [modelUser dropUser];
    [modelUser createUser];
    [modelUser insertUser:[modelUser getSampleData]];

    [[DBConnector getInstance] updateTable:@"user" data:@{@"name":@"kim",@"age":@"19"} where:nil];
    [modelUser selectUser];
    NSDictionary *array = [modelUser.user getObj];
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
