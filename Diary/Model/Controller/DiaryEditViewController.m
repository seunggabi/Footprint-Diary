//
//  DiaryEditViewController.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 14..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryEditViewController.h"
#import "HelperTool.h"

@interface DiaryEditViewController ()

@end

@implementation DiaryEditViewController

@synthesize diary;
@synthesize modelDiary;
@synthesize modelFootprint;
@synthesize modelSticker;
@synthesize modelEmoticon;
@synthesize modelWeather;
@synthesize modelPhoto;
@synthesize modelHealth;
@synthesize mapView;
@synthesize mapPointList;
@synthesize mapPolyLine;

@synthesize mapScreen;
@synthesize titleView;
@synthesize contentView;
@synthesize healthView;

-(void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadMapData:diary];
    [mapScreen addSubview:mapView];
    [self viewSetting:diary];
}

-(void) loadMapData:(Diary *)d {
    mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 186)];
    modelFootprint = [[FootprintModel alloc] init];
    NSMutableArray *footprintList = [modelFootprint select:[NSString stringWithFormat:@"fp_date ='%@'", diary.d_date]];
    [mapView setDaumMapApiKey:[HelperTool getInstance].apiKey];
    mapView.currentLocationTrackingMode = MTMapCurrentLocationTrackingOnWithoutHeading;
    mapView.delegate = self;
    mapView.baseMapType = MTMapTypeStandard;
    
    mapPolyLine = [MTMapPolyline polyLine];
    mapPointList = [[NSMutableArray alloc] init];
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
    
    mapPolyLine.polylineColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.5f];
    [mapPolyLine addPoints:mapPointList];
    [mapView addPolyline:mapPolyLine];
    [mapView fitMapViewAreaToShowPolyline:mapPolyLine];
}

-(void)viewSetting:(Diary *)d {
    modelHealth = [[HealthModel alloc] init];
    Health* h = [modelHealth recentData:d.d_date];
    if(h == nil) {
        h = [[Health alloc] init];
        h.h_count = @0;
    }
    
    self.navigationItem.title = d.d_date;
    titleView.text = d.d_title;
    contentView.text = d.d_content;
    healthView.text = [h.h_count stringValue];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end