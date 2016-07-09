//
//  FootprintViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintViewController.h"

@interface FootprintViewController () <CLLocationManagerDelegate>

@end

@implementation FootprintViewController

@synthesize mapView;
@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 186)];
    [mapView setDaumMapApiKey:@"6b7224206f752f1cf8d8d7b49546d424"];
    mapView.delegate = self;
    mapView.baseMapType = MTMapTypeHybrid;
    [self.mapScreen addSubview:mapView];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 20
                                                  target: self
                                                selector:@selector(getGPS)
                                                userInfo: nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)getGPS {
    [self startLocationManager];
}

-(void)startLocationManager
{
    NSLog(@"start GPS");
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    NSString *lat = [NSString stringWithFormat:@"%.8f", crnLoc.coordinate.latitude];
    NSString *log = [NSString stringWithFormat:@"%.8f", crnLoc.coordinate.longitude];
    NSLog(@"%@ %@", lat, log);
    
    NSLog(@"stop GPS");
    [locationManager stopUpdatingLocation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
