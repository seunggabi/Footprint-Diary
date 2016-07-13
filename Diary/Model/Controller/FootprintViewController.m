//
//  FootprintViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintViewController.h"
#import "HelperTool.h"

@interface FootprintViewController () <MTMapViewDelegate, MTMapReverseGeoCoderDelegate>

@end

@implementation FootprintViewController

@synthesize modelFootprint;
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    modelFootprint = [[FootprintModel alloc] init];
    //[modelFootprint drop];
    //[modelFootprint create];
    
    NSString *today = [[HelperTool getInstance] getToday];
    NSMutableArray *footprintList = [modelFootprint getDateList:today];
    
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

@end
