//
//  ViewController.m
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize modelUser;
@synthesize modelFootPrint;
@synthesize modelDiary;
@synthesize modelSticker;
@synthesize modelPhoto;
@synthesize modelEmoticon;
@synthesize modelHealth;
@synthesize modelHealthInfo;

- (void)viewDidLoad {
    // UserModel 연동
    modelUser = [[UserModel alloc] init];
    [modelUser drop];
    [modelUser create];
    [modelUser insert:[modelUser getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"user" data:@{@"u_name":@"kim",@"u_age":@"19"} where:nil];
    [modelUser select];
    // SELECT 확인
    NSDictionary *user = [modelUser.user getObj];
    NSLog(@"%@",user);

    // FootprintModel 연동
    modelFootPrint = [[FootprintModel alloc] init];
    [modelFootPrint drop];
    [modelFootPrint create];
    [modelFootPrint insert:[modelFootPrint getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Footprint" data:@{@"fp_address":@"zzz"} where:nil];
    // SELECT 확인
    NSDictionary *fp = [[[modelFootPrint select:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",fp);
    
    // DiaryModel 연동
    modelDiary = [[DiaryModel alloc] init];
    [modelDiary drop];
    [modelDiary create];
    [modelDiary insert:[modelDiary getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Diary" data:@{@"d_content":@"일기 수정완료"} where:nil];
    // SELECT 확인
    NSDictionary *d = [[[modelDiary select:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",d);
    
    // StickerModel 연동
    modelSticker = [[StickerModel alloc] init];
    [modelSticker drop];
    [modelSticker create];
    [modelSticker insert:[modelSticker getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Sticker" data:@{@"s_color":@0} where:nil];
    // SELECT 확인
    NSDictionary *s = [[[modelSticker select:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",s);
    
    // EmoticonModel 연동
    modelEmoticon = [[EmoticonModel alloc] init];
    [modelEmoticon drop];
    [modelEmoticon create];
    [modelEmoticon insert:[modelEmoticon getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Emoticon" data:@{@"e_name":@"happy"} where:nil];
    // SELECT 확인
    NSDictionary *e = [[[modelEmoticon select:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",e);
    
    // PhotoModel 연동
    modelPhoto = [[PhotoModel alloc] init];
    [modelPhoto drop];
    [modelPhoto create];
    [modelPhoto insert:[modelPhoto getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Photo" data:@{@"p_src":@"abc.png"} where:nil];
    // SELECT 확인
    NSDictionary *p = [[[modelPhoto select:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",p);
    
    // HealthModel 연동
    modelHealth = [[HealthModel alloc] init];
    [modelHealth dropHealth];
    [modelHealth createHealth];
    [modelHealth insertHealth:[modelHealth getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Health" data:@{@"h_count":@1234} where:nil];
    // SELECT 확인
    NSDictionary *h = [[[modelHealth selectHealth:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",h);

    // HealthInformationModel 연동
    modelHealthInfo = [[HealthInformationModel alloc] init];
    [modelHealthInfo drop];
    [modelHealthInfo create];
    [modelHealthInfo insert:[modelHealthInfo getSampleData]];
    // DBConnector UPDATE 사용
    [[DBConnector getInstance] updateTable:@"Health_Information" data:@{@"hi_comment":@"좋으니까 좋음"} where:nil];
    // SELECT 확인
    NSDictionary *hi = [[[modelHealthInfo select:nil] objectAtIndex:0] getObj];
    NSLog(@"%@",hi);
    
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
