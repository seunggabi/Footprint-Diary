//
//  ViewController.h
//  Pedometer
//
//  Created by Jay Versluis on 29/10/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreMotion;

@interface PedometerViewController : UIViewController

@property (strong, nonatomic) CMPedometer *pedometer;
@property (strong, nonatomic) IBOutlet UILabel *stepsLabel;
@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) IBOutlet UILabel *cadenceLabel;
@property (strong, nonatomic) IBOutlet UILabel *paceLabel;
@property (strong, nonatomic) IBOutlet UILabel *flightsUpLabel;
@property (strong, nonatomic) IBOutlet UILabel *flightsDownLabel;

@end