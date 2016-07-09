//
//  FootprintViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintViewController.h"

@interface FootprintViewController ()
@property (weak, nonatomic) IBOutlet UIView *mapScreen;

@end

@implementation FootprintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 186)];
    [_mapView setDaumMapApiKey:@"6b7224206f752f1cf8d8d7b49546d424"];
    _mapView.delegate = self;
    _mapView.baseMapType = MTMapTypeHybrid;
    [self.mapScreen addSubview:_mapView];
    [self getGPS];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getGPS {
    [self startLocationManager];
    [self.locationManager requestWhenInUseAuthorization];
    
}

-(void)startLocationManager
{
    _locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
    _locationManager.delegate = self; // we set the delegate of locationManager to self.
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
    [_locationManager startUpdatingLocation];  //requesting location updates
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];
    NSLog(@"Error: %@",error.description);
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{ 
    CLLocation *crnLoc = [locations lastObject];
    NSString *lat = [NSString stringWithFormat:@"%.8f", crnLoc.coordinate.latitude];
    NSString *log = [NSString stringWithFormat:@"%.8f", crnLoc.coordinate.longitude];
    NSLog(@"%@ %@", lat, log);
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
