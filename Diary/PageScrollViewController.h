//
//  PageScrollViewController.h
//  PageWithScrollView
//
//  Created by 유경수 on 2014. 5. 5..
//  Copyright (c) 2014년 유경수. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageScrollViewController : UIViewController<UIScrollViewDelegate>

// IBOUTLET
@property (weak, nonatomic)IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic)IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic)IBOutlet UIButton *btn_Prev;
@property (weak, nonatomic)IBOutlet UIButton *btn_Next;

// 컨트롤러들이 저장될 배열
@property (strong, nonatomic)NSMutableArray *controllers;

// 페이지 수동 전환용 IBACTION
-(IBAction)btn_ScrollMove:(id)sender;

@end
