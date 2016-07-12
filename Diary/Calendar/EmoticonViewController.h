//
//  emoticonViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface EmoticonViewController : UIViewController<UICollectionViewDelegate , UICollectionViewDataSource>{
    
    NSMutableArray *imgList;
}

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
