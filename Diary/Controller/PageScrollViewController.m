//
//  PageScrollViewController.m
//  PageWithScrollView
//
//  Created by 김승갑 on 2016. 7. 12..
//  Copyright (c)2016년 김승갑. All rights reserved.
//

#import "PageScrollViewController.h"
#import "PageViewController.h"

@interface PageScrollViewController ()

@end

@implementation PageScrollViewController

@synthesize scrollView;
@synthesize pageControl;
@synthesize controllers;
@synthesize btn_Next;
@synthesize btn_Prev;
@synthesize modelUser;
@synthesize user;
@synthesize tutorial;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    modelUser = [[UserModel alloc] init];
    user = [modelUser select];
    
    if([user.u_tutorial isEqualToString:@"Y"] || [tutorial isEqualToString:@"Y"]){
        [btn_Prev setTag:1];
        [btn_Next setTag:0];
        [self initScrollViewAndPageControl];
        [self gotoPage:FALSE AtPage:0];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@", [user getObj]);
    
    if([user.u_tutorial isEqualToString:@"N"] && ![tutorial isEqualToString:@"Y"]){
        [self performSegueWithIdentifier:@"skipTutorial" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Scroll View Delegate Function

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(scrollView.frame);
    NSUInteger page = floor((scrollView.contentOffset.x - pageWidth / 2)/ pageWidth)+ 1;
    pageControl.currentPage = page;

    [self loadScrollViewDataSourceWithPage:page - 1];
    [self loadScrollViewDataSourceWithPage:page];
    [self loadScrollViewDataSourceWithPage:page + 1];
}

- (void)initScrollViewAndPageControl {
    int numbersOfPage = 4;
    controllers = [[NSMutableArray alloc]init];
    CGSize contentSize = scrollView.frame.size;
    contentSize.width = scrollView.frame.size.width * numbersOfPage;
    
    for(int idx = 0 ; idx < numbersOfPage ; idx++){
        [controllers addObject:[NSNull null]];
    }
    
    [scrollView setContentSize:contentSize];
    [scrollView setDelegate:self];
    [scrollView setPagingEnabled:YES];
    [scrollView setBounces:NO];
    [scrollView setScrollsToTop:NO];
    [scrollView setScrollEnabled:YES];
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    [pageControl setNumberOfPages:numbersOfPage];
    [pageControl setCurrentPage:0];
    
    [self loadScrollViewDataSourceWithPage:0];
    [self loadScrollViewDataSourceWithPage:1];
}

- (void)loadScrollViewDataSourceWithPage:(NSInteger)page{
    if(page >= controllers.count)
        return;
    PageViewController *controller = [controllers objectAtIndex:page];
    
    if((NSNull *)controller == [NSNull null]){
        NSLog(@"Page %ld Controller Init..",(long)page);
        
        controller = [[self storyboard] instantiateViewControllerWithIdentifier:@"SinglePageView"];
        [controller.view setFrame:scrollView.frame];
        [controller initPageViewInfo:page];
        [controllers replaceObjectAtIndex:page withObject:controller];
    }
    
    if(controller.view.superview == nil){
        NSLog(@"Page %ld Controller Add On ScrollView..",(long)page);
        
        CGRect curFrame = scrollView.frame;
        curFrame.origin.x = CGRectGetWidth(curFrame)* page;
        curFrame.origin.y = 0;
        controller.view.frame = curFrame;
        
        [self addChildViewController:controller];
        [scrollView addSubview:controller.view];
        [controller didMoveToParentViewController:self];
    }
}

- (void)gotoPage:(BOOL)animated AtPage:(NSInteger)page {
    [pageControl setCurrentPage:page];

    [self loadScrollViewDataSourceWithPage:page - 1];
    [self loadScrollViewDataSourceWithPage:page];
    [self loadScrollViewDataSourceWithPage:page + 1];
    
    CGRect bounds = scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds)* page;
    bounds.origin.y = 0;
    
    [scrollView scrollRectToVisible:bounds animated:animated];
}
@end
