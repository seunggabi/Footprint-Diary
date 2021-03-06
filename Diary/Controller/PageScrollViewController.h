//
//  PageScrollViewController.h
//  PageWithScrollView
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright (c)2016년 김승갑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface PageScrollViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *btn_Prev;
@property (weak, nonatomic) IBOutlet UIButton *btn_Next;
@property (strong, nonatomic) NSMutableArray *controllers;
@property (strong, nonatomic) UserModel *modelUser;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSString *tutorial;

@end
