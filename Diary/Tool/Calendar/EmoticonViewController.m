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

@synthesize imageList;
@synthesize collectionView;
@synthesize wButton;
@synthesize emoticonList;
@synthesize weatherList;

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
    
    UINib* nib = [UINib nibWithNibName:@"Cell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"imageCell"];
    [self.collectionView reloadData];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    UIImageView* imgView = (UIImageView*)[cell.contentView viewWithTag:100];
    if (imgView)imgView.image = [UIImage imageNamed:((Emoticon *)[emoticonList objectAtIndex:indexPath.item]).e_src];
    NSLog(@"image %@", imgView.image);
    cell.layer.backgroundColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.backgroundColor  = [UIColor whiteColor].CGColor;
    return cell;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return emoticonList.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [wButton setImage:[UIImage imageNamed:((Emoticon *)[emoticonList objectAtIndex:indexPath.item]).e_src] forState:UIControlStateSelected];
    [wButton setSelected:NO];
    NSLog(@"indexPathItem %ld ", (long)indexPath.item);
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
