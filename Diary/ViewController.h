//
//  ViewController.h
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

- (IBAction)buttonTouch:(id)sender;
- (IBAction) digitPressed:(UIButton *)sender;
- (IBAction) operationPressed:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@end

