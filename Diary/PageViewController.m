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

@synthesize imageView;
@synthesize titleLabel;
@synthesize startButton;
@synthesize checkbox;
@synthesize checkboxSelected;

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
    if(page != 3) {
        startButton.hidden = YES;
        titleLabel.hidden = YES;
        checkbox.hidden = YES;
    }
    
    [checkbox setBackgroundImage:[UIImage imageNamed:@"cool.png"]
                        forState:UIControlStateNormal];
    [checkbox setBackgroundImage:[UIImage imageNamed:@"smile.png"]
                        forState:UIControlStateSelected];
    checkbox.adjustsImageWhenHighlighted=NO;
    // 현재 페이지의 이미지와 텍스트 적용
    [imageView setImage:[UIImage imageNamed:imgName]];    
}

- (IBAction)checkboxSelected:(id)sender {
    checkboxSelected = !checkboxSelected; /* Toggle */
    [checkbox setSelected:checkboxSelected];
    [sender setHighlighted:NO];
}

@end
