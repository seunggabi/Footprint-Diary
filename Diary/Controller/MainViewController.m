//
//  ViewController.m
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "MainViewController.h"
#import "../Tool/TimerScheduler.h"
#import "../Tool/HelperTool.h"

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

- (CMPedometer *)pedometer {
    
    if (!_pedometer) {
        _pedometer = [[CMPedometer alloc]init];
    }
    return _pedometer;
}

- (void)viewDidLoad {
    //Table 생성 & Model 초기화
    modelUser = [[UserModel alloc] init];
    [modelUser create];
    modelFootPrint = [[FootprintModel alloc] init];
    [modelFootPrint create];
    modelDiary = [[DiaryModel alloc] init];
    [modelDiary create];
    modelSticker = [[StickerModel alloc] init];
    [modelSticker create];
    modelEmoticon = [[EmoticonModel alloc] init];
    [modelEmoticon create];
    modelPhoto = [[PhotoModel alloc] init];
    [modelPhoto create];
    modelHealth = [[HealthModel alloc] init];
    [modelHealth create];
    modelHealthInfo = [[HealthInformationModel alloc] init];
    [modelHealthInfo create];
    
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
    }];
    [[TimerScheduler getInstance] setPedometerTimer:[NSTimer scheduledTimerWithTimeInterval: 5
                                                                                     target: self
                                                                                   selector:@selector(getPedomterCount)
                                                                                   userInfo: nil repeats:YES]];
    [super viewDidLoad];
}

-(void)getPedomterCount {
    Health *health = [[Health alloc] init];
    health.h_time = [NSDate date];
    NSString *today = [[HelperTool getInstance] getToday];
    health.h_date = today;
    NSDate *now = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:now];
    NSDate *start = [gregorian dateFromComponents:components];
    
    // take "now" and normalise to 23:59
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    NSDate *end = [gregorian dateFromComponents:components];
    
    // display results
    [self.pedometer queryPedometerDataFromDate:start toDate:end withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        health.h_count = pedometerData;
    }];
    [modelHealth insertData:health];
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
