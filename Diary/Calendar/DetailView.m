//
//  DetailView.m
//  PhotoDiary
//
//  Created by Ssyong on 11/28/13.
//  Copyright (c) 2013 Photo. All rights reserved.
//

#import "DetailView.h"

@interface DetailView ()

@end

@implementation DetailView
@synthesize lblTitleText;
@synthesize tvtView;
@synthesize scrollview;
@synthesize indexDay;
@synthesize indexMonth;
@synthesize indexYear;
@synthesize dataArray;
@synthesize imgSelected;
@synthesize popUpview;
@synthesize btnSelectedImage;

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
    // Do any additional setup after loading the view from its nib.
    NSDate* today = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:today];
    
    lblTitleText.text = [NSString stringWithFormat:@"%d / %d / %d", indexYear, indexMonth, indexDay];
    dataArray = [[NSMutableArray alloc] init];
    
    originImage = [UIImage imageNamed:@"default.png"];
    [imgSelected setImage:originImage];
    
    //    [self showActivityViewer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)Refresh:(id)sender{
    NSDate* today = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:today];
    
    NSInteger iMonth = [dateComponents month];
    NSString * strMonth = [NSString stringWithFormat:@"%d", iMonth];
    
    NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"PhotoDiary"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:strMonth,@"month",@"",@"indexImage",@"",@"content", nil];
    //Replace object after edit
    [dataMutableArray replaceObjectAtIndex:indexDay withObject:dic];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)Commit:(id)sender{
    NSDate* today = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:today];
    
    NSInteger iMonth = [dateComponents month];
    NSString * strMonth = [NSString stringWithFormat:@"%d", iMonth];
    
    NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"Vurig Calendar"];
    NSString * strIndex = [NSString stringWithFormat:@"%d", indexImage];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:strMonth,@"month",strIndex,@"indexImage",tvtView.text,@"content", nil];
    //Replace object after edit
    [dataMutableArray replaceObjectAtIndex:indexDay withObject:dic];
    
    NSString *text = tvtView.text;
    //    NSData *data = [text dataUsingEncoding:NSUTF8StringEncoding];
    //    [[NSFileManager defaultManager] createFileAtPath:@"/Users/mju/Documents/PhotoDiary2/text.txt"
    //                                            contents: data attributes:nil];
    //  NSArray *fileDic = [[NSDictionary alloc] initWithContentsOfFile:@"/Users/mju/Documents/PhotoDiary2/text.txt"];
    //  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Dict" ofType:@"txt"];
    //  dic=[NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"text: %@",text);
    [text writeToFile:@"/Users/mju/Documents/PhotoDiary 3/text.txt"
           atomically:YES
             encoding:NSUTF8StringEncoding
                error:NULL];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString* newTempDirPath = [NSTemporaryDirectory() stringByAppendingString:@"textfile"];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error = nil;
    BOOL created = [fileManager createDirectoryAtPath:newTempDirPath withIntermediateDirectories:YES attributes:nil error:&error];
    
    // 파일 경로
    NSString* filePath = [newTempDirPath stringByAppendingPathComponent:@"sampleFile.txt"];
    
    // 저장할 텍스트 내용
    NSString* string = text;
    
    // 파일로 쓰기
    created = [string writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(@" %d",created);
    // 텍스트 파일을 읽기
    NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"fileContents: %@",fileContents);
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
-(IBAction)runGeneralPicker{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void)finishedPicker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info{
    originImage = nil;
    originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self finishedPicker];
    [imgSelected setImage:originImage];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self finishedPicker];
}


//- (void)hideActivityViewer
//{
//    isLoading = NO;
//
//    [[[activityView subviews] objectAtIndex:0] stopAnimating];
//    //    [activityView removeFromSuperview];
//    [backGroundView removeFromSuperview];
//    activityView = nil;
//}
//
//- (void)showActivityViewer
//{
//    isLoading = YES;
//    //    CGFloat height;
//    //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
//    //        CGSize result = [[UIScreen mainScreen] bounds].size;
//    //        if (result.height == 480) {
//    //            height = 365;
//    //        }
//    //        if (result.height == 568) {
//    //            height = 473;
//    //        }
//    //    }
//    //    height = self.view.frame.size.height - 35 - 60;
//    backGroundView = [[UIView alloc] initWithFrame: CGRectMake(0, 35, self.view.frame.size.width, self.view.frame.size.height)];
//    //    backGroundView.backgroundColor = [UIColor blueColor];
//
//    activityView = [[UIView alloc] initWithFrame: CGRectMake(self.view.frame.size.width/2 - 70, self.view.frame.size.height/2 - 80 , 140, 90)];
//    //    [activityView.layer setCornerRadius:10.0f];
//    activityView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6f];
//    activityView.alpha = 1.0;
//
//    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(activityView.bounds.size.width/2 - 38, (activityView.bounds.size.height/2 - 12)+18, 90, 24)];
//    [loadingLabel setText:@"Loading"];
//    [loadingLabel setBackgroundColor:[UIColor clearColor]];
//    [loadingLabel setTextColor:[UIColor whiteColor]];
//
//    UIActivityIndicatorView *activityWheel = [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(activityView.bounds.size.width/2 - 12, activityView.bounds.size.height/2 - 24, 24, 24)];
//    activityWheel.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
//    activityWheel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
//                                      UIViewAutoresizingFlexibleRightMargin |
//                                      UIViewAutoresizingFlexibleTopMargin |
//                                      UIViewAutoresizingFlexibleBottomMargin);
//    [activityView addSubview:activityWheel];
//    [activityView addSubview:loadingLabel];
//    [backGroundView addSubview: activityView];
//    [self.view addSubview:backGroundView];
//
//    [[[activityView subviews] objectAtIndex:0] startAnimating];
//}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"textViewDidBeginEditing");
    [textView becomeFirstResponder];
    self.view.frame = CGRectMake(0, -150, 320, 480);
    btnSelectedImage.hidden = TRUE;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"textViewDidEndEditing");
    self.view.frame = CGRectMake(0, 20, 320, 480);
    [textView resignFirstResponder];
    btnSelectedImage.hidden = FALSE;
}

-(void)touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    NSArray *subviews = [self.view subviews];
    for (id objects in subviews) {
        if ([objects isKindOfClass:[UITextView class]]) {
            UITextView *theTextField = objects;
            if ([objects isFirstResponder]) {
                [theTextField resignFirstResponder];
            }
        }
    }
}

@end
