//
//  ViewController.h
//  datePicker
//
//  Created by mju on 2016. 7. 11..
//  Copyright © 2016년 recipeGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic,strong) UIDatePicker *datePicker;
@end

