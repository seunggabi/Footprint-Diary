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

static NSString *cellIdentifier = @"Cell";
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    
    UINib* nib = [UINib nibWithNibName:@"Cell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];

    imgList = [[NSMutableArray alloc] initWithObjects:
               @"img01.jpg",@"img02.jpg",@"img03.jpg",@"img04.jpg",@"img05.jpg",
               @"img06.jpg",@"img07.jpg",@"img08.jpg",@"img09.jpg",nil];
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 재사용 큐에 셀을 가져온다
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell forIndexPath:indexPath];
    
    // 표시할 이미지 설정
    UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];

    
    return cell;
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return imgList.count;
}




@end
