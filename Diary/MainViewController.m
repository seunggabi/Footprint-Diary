//
//  ViewController.m
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "MainViewController.h"
#import "Model/UserModel.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize modelUser;
@synthesize modelFootPrint;

- (void)viewDidLoad {
    // UserModel 연동
    modelUser = [[UserModel alloc] init];
    [modelUser dropUser];
    [modelUser createUser];
    [modelUser insertUser:[modelUser getSampleData]];

    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"user" data:@{@"u_name":@"kim",@"age":@"19"} where:nil];
    [modelUser selectUser];
    
    // SELECT 확인
    NSDictionary *user = [modelUser.user getObj];
    NSLog(@"%@",user);
    
    // FootprintModel 연동
    modelFootPrint = [[FootprintModel alloc] init];
    [modelFootPrint dropFootprint];
    [modelFootPrint createFootprint];
    [modelFootPrint insertFootprint:[modelFootPrint getSampleData]];
    
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Footprint" data:@{@"address":@"zzz"} where:nil];
    
    // SELECT 확인
    NSDictionary *fp = [[[modelFootPrint selectFootprint:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",fp);
    
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
