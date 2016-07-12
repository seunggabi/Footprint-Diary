//
//  emoticonViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "EmoticonViewController.h"

@interface EmoticonViewController()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation EmoticonViewController

@synthesize collectionView;

static NSString *cellIdentifier = @"Cell";
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
    
    UINib* nib = [UINib nibWithNibName:@"Cell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"imageCell"];

    imgList = [[NSMutableArray alloc] init];
    UIImage* img = [UIImage imageNamed:@"cool.png"];
    [imgList addObject:img];
    [self.collectionView reloadData];
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 재사용 큐에 셀을 가져온다
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    
    // 표시할 이미지 설정
    UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];
    if (imgView) imgView.image = [UIImage imageNamed:@"cool.png"];
    NSLog(@"%@", cell);
    
    return cell;
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return imgList.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return imgList.count;
}




@end
