//
//  FootprintViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintViewController.h"
#import "../Helper/TimerScheduler.h"
#import "../Helper/Helper.h"

@interface FootprintViewController () <CLLocationManagerDelegate, MTMapViewDelegate, MTMapReverseGeoCoderDelegate>

@end

@implementation FootprintViewController

@synthesize modelFootprint;
@synthesize mapView;
@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    modelFootprint = [[FootprintModel alloc] init];
    
    mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 186)];
    [mapView setDaumMapApiKey:[Helper getInstance].apiKey];
    mapView.delegate = self;
    mapView.baseMapType = MTMapTypeHybrid;
    [self.mapScreen addSubview:mapView];
    
    locationManager = [[CLLocationManager alloc]init];
    [[TimerScheduler getInstance] setFootprintTiemr:[NSTimer scheduledTimerWithTimeInterval:3
                                                                                     target:self
                                                                                   selector:@selector(getGPS)
                                                                                   userInfo:nil
                                                                                    repeats:YES]];
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
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [locationManager stopUpdatingLocation];
    CLLocation *crnLoc = [locations lastObject];
    NSNumber *lat = [NSNumber numberWithDouble:crnLoc.coordinate.latitude];
    NSNumber *log = [NSNumber numberWithDouble:crnLoc.coordinate.longitude];
    
    Footprint *fp = [[Footprint alloc] init];
    fp.fp_date = [[Helper getInstance] getToday];
    fp.fp_time = [NSDate date];
    fp.fp_GPS_X = lat;
    fp.fp_GPS_Y = log;
    fp.fp_address = [MTMapReverseGeoCoder findAddressForMapPoint:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake([lat doubleValue],[log doubleValue])] withOpenAPIKey:[Helper getInstance].apiKey];
    [modelFootprint insertData:fp];
    
    NSDictionary *d = [[[modelFootprint select:@"1=1 ORDER BY fp_id DESC"] objectAtIndex:0] getObj];
    NSLog(@"%@", d);
    NSLog(@"stop GPS");
}

@end
