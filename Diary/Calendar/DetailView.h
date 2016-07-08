//
//  DetailView.h
//  PhotoDiary
//
//  Created by Ssyong on 11/28/13.
//  Copyright (c) 2013 Photo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetsGroup.h>
#import <ImageIO/CGImageSource.h>

@interface DetailView : UIViewController{
    UIButton * button;
    BOOL isFromSaveImage;
    int currentTotalImage;
    int indexImage;
    UIImage *originImage;
    //Loading
    UIView                  *activityView;
    UIView                  *backGroundView;
    BOOL                    isLoading;
}


@property (assign, nonatomic) int indexMonth;
@property (assign, nonatomic) int indexDay;
@property (assign, nonatomic) int indexYear;
@property (retain, nonatomic) IBOutlet NSMutableArray *dataArray;
@property (retain, nonatomic) IBOutlet UILabel * lblTitleText;
@property (retain, nonatomic) IBOutlet UIScrollView * scrollview;
@property (retain, nonatomic) IBOutlet UITextView * tvtView;
@property (retain, nonatomic) IBOutlet UIImageView * imgSelected;
@property (retain, nonatomic) IBOutlet UIView * popUpview;
@property (retain, nonatomic) IBOutlet UIButton * btnSelectedImage;

- (IBAction)back:(id)sender;
- (IBAction)Refresh:(id)sender;
- (IBAction)Commit:(id)sender;
- (IBAction)selectedImage:(id)sender;
+ (ALAssetsLibrary *)defaultAssetsLibrary;
- (void)showActivityViewer;
- (void)hideActivityViewer;

@end
