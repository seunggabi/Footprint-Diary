//
//  PageViewController.m
//  PageWithScrollView
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright (c) 2016년 김승갑. All rights reserved.
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
@synthesize modelUser;

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
    
    modelUser = [[UserModel alloc] init];
    User *user = [modelUser select];
    NSLog(@"%@",[user getObj]);
    if([user.u_tutorial isEqualToString:@"Y"]) {
        [self performSegueWithIdentifier:@"skipTutorial" sender:self];
    }
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
    
    [checkbox setBackgroundImage:[UIImage imageNamed:@"checkbox.jpeg"]
                        forState:UIControlStateNormal];
    [checkbox setBackgroundImage:[UIImage imageNamed:@"checkboxSelected.jpeg"]
                        forState:UIControlStateSelected];
    checkbox.backgroundColor=nil;
    // 현재 페이지의 이미지와 텍스트 적용
    [imageView setImage:[UIImage imageNamed:imgName]];    
}

- (IBAction)checkboxSelected:(id)sender {
    checkboxSelected = !checkboxSelected; /* Toggle */
    [checkbox setSelected:checkboxSelected];
    [checkbox setHighlighted:NO];
}

@end
