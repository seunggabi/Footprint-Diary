//
//  PageViewController.h
//  PageWithScrollView
//
//  Created by 유경수 on 2014. 5. 5..
//  Copyright (c) 2014년 유경수. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController

@property (strong,nonatomic)IBOutlet UIImageView *imageView;
@property (strong,nonatomic)IBOutlet UILabel *titleLabel;

-(void)initPageViewInfo:(NSInteger)page;


@end
