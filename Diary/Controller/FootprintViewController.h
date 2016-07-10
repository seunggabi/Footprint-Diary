//
//  FootprintViewController.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DaumMap/MTMapView.h>
#import <DaumMap/MTMapReverseGeoCoder.h>
#import <CoreLocation/CoreLocation.h>
#import "../Model/FootprintModel.h"
#import "../Model/UserModel.h"

@interface FootprintViewController : UIViewController

@property (strong, nonatomic) FootprintModel *modelFootprint;
@property (strong, nonatomic) UserModel *modelUser;
@property (weak, nonatomic) IBOutlet UIView *mapScreen;
@property (strong, nonatomic) MTMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end
