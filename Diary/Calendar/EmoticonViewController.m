//
//  emoticonViewController.m
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "EmoticonViewController.h"

@interface EmoticonViewController()

@end

@implementation EmoticonViewController

static NSString *cellIdentifier = @"Cell";
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    
    imgList = [[NSMutableArray alloc] initWithObjects:
               @"img01.jpg",@"img02.jpg",@"img03.jpg",@"img04.jpg",@"img05.jpg",
               @"img06.jpg",@"img07.jpg",@"img08.jpg",@"img09.jpg",nil];
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
