//
//  FootprintViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintViewController.h"
#import "../Tool/TimerScheduler.h"
#import "../Tool/HelperTool.h"

@interface FootprintViewController () <CLLocationManagerDelegate, MTMapViewDelegate, MTMapReverseGeoCoderDelegate>

@end

@implementation FootprintViewController

@synthesize modelFootprint;
@synthesize modelUser;
@synthesize mapView;
@synthesize locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    modelFootprint = [[FootprintModel alloc] init];
    modelUser = [[UserModel alloc] init];
    
//    [modelFootprint drop];
//    [modelFootprint create];
    
    User *u = [modelUser select];
    NSMutableArray *footprintList = [modelFootprint select:nil];
    
    mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 186)];
    [mapView setDaumMapApiKey:[HelperTool getInstance].apiKey];
    mapView.currentLocationTrackingMode = MTMapCurrentLocationTrackingOnWithoutHeading;
    mapView.delegate = self;
    mapView.baseMapType = MTMapTypeStandard;
    
    MTMapPolyline *polyline = [MTMapPolyline polyLine];
    polyline.polylineColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.5f];
    
    NSMutableArray *mapPointList = [[NSMutableArray alloc] init];
    for(int i=0; i<footprintList.count; i++) {
        Footprint *fp = [footprintList objectAtIndex:i];
        MTMapPOIItem *poiItem = [MTMapPOIItem poiItem];
        poiItem.itemName = fp.fp_address;
        poiItem.mapPoint = [MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake([fp.fp_GPS_Y doubleValue],[fp.fp_GPS_X doubleValue])];
        poiItem.markerType = MTMapPOIItemMarkerTypeBluePin;
        poiItem.markerSelectedType = MTMapPOIItemMarkerSelectedTypeRedPin;
        poiItem.showAnimationType = MTMapPOIItemShowAnimationTypeDropFromHeaven;
        poiItem.draggable = NO;
        poiItem.tag = i;
        [mapView addPOIItems:[NSArray arrayWithObjects:poiItem, nil]];
        [mapPointList addObject:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake([fp.fp_GPS_Y doubleValue],[fp.fp_GPS_X doubleValue])]];
    }
    [polyline addPoints:mapPointList];

    [mapView addPolyline:polyline];
    [mapView fitMapViewAreaToShowPolyline:polyline];
    [self.mapScreen addSubview:mapView];
    
    locationManager = [[CLLocationManager alloc]init];
    [[TimerScheduler getInstance] setFootprintTiemr:[NSTimer scheduledTimerWithTimeInterval:[u.u_timer intValue]>0?[u.u_timer intValue]:1*5
                                                                                     target:self
                                                                                   selector:@selector(getGPS)
                                                                                   userInfo:nil
                                                                                    repeats:YES]];
}

- (void)MTMapView:(MTMapView*)mapView updateCurrentLocation:(MTMapPoint*)location withAccuracy:(MTMapLocationAccuracy)accuracy {
    MTMapPointGeo currentLocationPointGeo = location.mapPointGeo;
    NSLog(@"MTMapView updateCurrentLocation (%f,%f) accuracy (%f)",
          currentLocationPointGeo.latitude,
          currentLocationPointGeo.longitude,
          accuracy);
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
    fp.fp_date = [[HelperTool getInstance] getToday];
    fp.fp_time = [[HelperTool getInstance] getDate];
    fp.fp_GPS_X = log;
    fp.fp_GPS_Y = lat;
    [fp setAddress];
    [modelFootprint insertData:fp];

    NSDictionary *d = [[[modelFootprint select:@"1=1 ORDER BY fp_id DESC"] objectAtIndex:0] getObj];
    NSLog(@"%@", d);
    NSLog(@"stop GPS");
}

@end
