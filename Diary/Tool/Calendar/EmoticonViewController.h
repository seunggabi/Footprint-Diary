//
//  emoticonViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmoticonModel.h"
#import "WeatherModel.h"

@interface EmoticonViewController : UIViewController<UICollectionViewDelegate , UICollectionViewDataSource>{
}

@property (strong, nonatomic) Emoticon *emoticon;
@property (strong, nonatomic) NSMutableArray *imageList;
@property (strong, nonatomic) NSMutableArray *emoticonList;
@property (strong, nonatomic) NSMutableArray *weatherList;

@property (strong, nonatomic) IBOutlet UIButton *wButton;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
