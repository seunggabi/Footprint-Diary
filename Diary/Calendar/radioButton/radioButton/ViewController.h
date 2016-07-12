//
//  ViewController.h
//  radioButton
//
//  Created by mju on 2016. 7. 12..
//  Copyright © 2016년 recipeGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIButton *radioButton1;
@property (strong, nonatomic) IBOutlet UIButton *radioButton2;
@property (strong, nonatomic) IBOutlet UIButton *radioButton3;
@property (strong, nonatomic) IBOutlet UIButton *radioButton4;

@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;
@property (weak, nonatomic) IBOutlet UITextField *text3;
@property (weak, nonatomic) IBOutlet UITextField *text4;
- (IBAction)radioButtonClicked:(id)sender;

@end

