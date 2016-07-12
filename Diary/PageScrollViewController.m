//
//  PageScrollViewController.m
//  PageWithScrollView
//
//  Created by 유경수 on 2014. 5. 5..
//  Copyright (c) 2014년 유경수. All rights reserved.
//

#import "PageScrollViewController.h"
#import "PageViewController.h"

@interface PageScrollViewController ()

@end

@implementation PageScrollViewController

@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize controllers = _controllers;
@synthesize btn_Next = _btn_Next;
@synthesize btn_Prev = _btn_Prev;

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
    
    // 버튼을 구분하기 위해 버튼에 tag를 설정해줍니다.
    [_btn_Prev setTag:1];
    [_btn_Next setTag:0];
    
    // 스크롤 뷰와 페이지 컨트롤들을 초기화해줍니다.
    [self initScrollViewAndPageControl];
    
    // 만약 최초에 보여줄 페이지를 변경하려면 아래줄의 주석을 풀어주면 됩니다.
    // Page는 원하는 페이지로 설정할 수 있습니다.
     [self gotoPage:FALSE AtPage:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scroll View Delegate Function

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // ScrollView의 드래그가 멈춘경우
    CGFloat pageWidth = CGRectGetWidth(_scrollView.frame);
    // 현재 페이지를 구합니다. floor는 소수점 자리를 버리는 함수입니다
    NSUInteger page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    // 현재 페이지를 계산된 페이지로 설정해줍니다.
    _pageControl.currentPage = page;

    // 보여줄 페이지들을 미리 로드합니다.
    [self loadScrollViewDataSourceWithPage:page - 1];
    [self loadScrollViewDataSourceWithPage:page];
    [self loadScrollViewDataSourceWithPage:page + 1];
}

#pragma mark - Scroll View DataSource Load

-(void)initScrollViewAndPageControl{
    // 스크롤뷰와 페이지 컨트롤에 관련된 변수들을 초기화합니다.
    
    // 임의로 표시할 페이지 수를 설정합니다.
    int numbersOfPage = 4;
    
    // 컨트롤러들을 저장할 배열을 초기화합니다.
    _controllers = [[NSMutableArray alloc]init];
    
    // 최초에 값을 넣어줄때는 배열에 Null을 넣어줍니다.
    for(int idx = 0 ; idx < numbersOfPage ; idx++){
        [_controllers addObject:[NSNull null]];
    }
    
    // 스크롤 뷰의 컨텐츠 사이즈를 미리 만들어둡니다.
    CGSize contentSize = _scrollView.frame.size;
    contentSize.width = _scrollView.frame.size.width * numbersOfPage;
    
    // 스크롤 뷰의 컨텐츠 사이즈를 설정합니다.
    [_scrollView setContentSize:contentSize];
    // 스크롤 뷰의 Delegate를 설정합니다. ScrollView Delegate 함수를 사용하기 위함입니다.
    [_scrollView setDelegate:self];
    // 스크롤 뷰의 페이징 기능을 ON합니다.
    [_scrollView setPagingEnabled:YES];
    // 스크롤 뷰의 Bounce를 Disabled합니다 첫 페이지와 마지막 페이지에서 애니메이션이 발생하지않습니다.
    [_scrollView setBounces:NO];
    [_scrollView setScrollsToTop:NO];
    [_scrollView setScrollEnabled:YES];
    
    // 스크롤 바들을 보이지 않습니다.
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    // 현재 페이지 컨트롤의 페이지 숫자와 현재 페이지를 설정합니다.
    [_pageControl setNumberOfPages:numbersOfPage];
    [_pageControl setCurrentPage:0];
    
    // 최초에 보여줄 페이지를 미리 2개만 로드합니다.
    [self loadScrollViewDataSourceWithPage:0];
    [self loadScrollViewDataSourceWithPage:1];
}

- (void)loadScrollViewDataSourceWithPage:(NSInteger)page{
    // 스크롤뷰에서 표시할 뷰를 미리 로드합니다.
    
    // 페이지가 범위를 벗어나면 로드하지않습니다.
    if(page >= _controllers.count)
        return;

    // 페이지의 뷰컨트롤러를 배열에서 읽어옵니다.
    PageViewController *controller = [_controllers objectAtIndex:page];
    
    // 현재 컨트롤러가 비어있다면, 컨트롤러를 초기화해줍니다.
    // (initScrollViewAndPageControl 참조)
    if((NSNull *)controller == [NSNull null]){
        NSLog(@"Page %d Controller Init..",page);
        
        // 현재 스토리보드에서 SinglePageView라는 StoryboardIdentifier를 가진 뷰를 읽어옵니다.
        controller = [[self storyboard] instantiateViewControllerWithIdentifier:@"SinglePageView"];
        // 현재 컨트롤러의 뷰에 Frame을 초기화해줍니다.
        [controller.view setFrame:_scrollView.frame];
        // 컨트롤러에 이미지와 텍스트들을 설정합니다.
        [controller initPageViewInfo:page];
        // 현재 컨트롤러와 배열에 들어있는 객체를 교체합니다.
        [_controllers replaceObjectAtIndex:page withObject:controller];
    }
    
    // 현재 컨트롤러의 뷰가 superview를 가지지 못했을 경우(현재 스크롤뷰의 서브뷰가 아닌 경우)
    // 스크롤 뷰의 서브뷰로 추가해줍니다.
    if(controller.view.superview == nil){
        NSLog(@"Page %d Controller Add On ScrollView..",page);
        
        // 현재 컨트롤러의 뷰가 위치할 frame을 잡아줍니다.
        // Page에 따라 Origin의 x값이 달라집니다.
        CGRect curFrame = _scrollView.frame;
        curFrame.origin.x = CGRectGetWidth(curFrame) * page;
        curFrame.origin.y = 0;
        controller.view.frame = curFrame;
        
        // 컨트롤러를 현재 컨트롤러의 ChildViewController로 등록하고 컨트롤러의 뷰를 스크롤뷰에 Subview로 추가해줍니다.
        [self addChildViewController:controller];
        [_scrollView addSubview:controller.view];
        [controller didMoveToParentViewController:self];
    }
}

#pragma mark - ScrollView Paging Function

- (void)gotoPage:(BOOL)animated AtPage:(NSInteger)page{
    // 스크롤을 임의로 원하는 페이지로 이동시킵니다.
    
    // 페이지 컨트롤의 현재 페이지를 넘겨받은 페이지로 설정합니다.
    [_pageControl setCurrentPage:page];
    
    // 미리 뷰를 로드합니다.
    [self loadScrollViewDataSourceWithPage:page - 1];
    [self loadScrollViewDataSourceWithPage:page];
    [self loadScrollViewDataSourceWithPage:page + 1];
    
    // 보여줄 스크롤뷰의 ContentOffset을 설정합니다.
    // 스크롤 뷰의 Width * Page입니다.
    CGRect bounds = _scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    
    // 정해진 부분으로 스크롤뷰를 스크롤합니다.
    [_scrollView scrollRectToVisible:bounds animated:animated];
    
}

#pragma mark - IBACTION

-(IBAction)btn_ScrollMove:(id)sender{
    // 버튼을 누르거나, 페이지컨트롤의 값이 변경될 경우 스크롤을 이동시킵니다.
    
    // 버튼은 Tag로 구분하며, pageControl은 태그를 설정해두지않았습니다.
    if([sender tag] == 0){
        if(_pageControl.currentPage < 3){
            [self gotoPage:YES AtPage:_pageControl.currentPage + 1];
        }
        else{
            [self alertViewShowsWithMessage:@"마지막 페이지입니다"];
        }
    }
    else if([sender tag] == 1){
        if(_pageControl.currentPage > 0){
            [self gotoPage:YES AtPage:_pageControl.currentPage - 1];
        }
        else{
            [self alertViewShowsWithMessage:@"첫 페이지입니다"];
        }
    }
    else{
        [self gotoPage:YES AtPage:_pageControl.currentPage];
    }
}

#pragma mark - Utility

-(void)alertViewShowsWithMessage:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"ScrollViewExample" message:message delegate:self cancelButtonTitle:@"확인" otherButtonTitles: nil];
    
    [alertView show];
}

@end
