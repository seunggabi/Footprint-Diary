//
//  PageViewController.m
//  PageWithScrollView
//
//  Created by 유경수 on 2014. 5. 5..
//  Copyright (c) 2014년 유경수. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

@synthesize imageView = _imageView;
@synthesize titleLabel = _titleLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init

-(void)initPageViewInfo:(NSInteger)page{
    NSString *imgName;

    switch (page) {
        case 0:
            imgName = @"page1.png";
            break;
        case 1:
            imgName = @"page2.png";
            break;
        case 2:
            imgName = @"page3.png";
            break;
        case 3:
            imgName = @"page4.png";
            break;
        default:
            break;
    }
    
    // 현재 페이지의 이미지와 텍스트 적용
    [_imageView setImage:[UIImage imageNamed:imgName]];
    [_titleLabel setText:[NSString stringWithFormat:@"Page %d",page]];
    
}

@end
