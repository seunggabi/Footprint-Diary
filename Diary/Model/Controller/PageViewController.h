//
//  PageViewController.h
//  PageWithScrollView
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright (c) 2016년 김승갑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface PageViewController : UIViewController

@property (strong,nonatomic)IBOutlet UIImageView *imageView;
@property (strong,nonatomic)IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *checkbox;
@property (assign, nonatomic) BOOL checkboxSelected;
@property (strong, nonatomic) UserModel *modelUser;

-(void)initPageViewInfo:(NSInteger)page;
- (IBAction)checkboxSelected:(id)sender;


@end
