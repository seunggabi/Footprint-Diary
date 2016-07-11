//
//  emoticonViewController.h
//  Diary
//
//  Created by mju on 2016. 7. 10..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Emoticon.h"
#import "Sticker.h"

@interface EmoticonViewController : UIViewController

@property (strong, nonatomic) Emoticon *emoticon;
@property (strong, nonatomic) Sticker *sticker;

-(Emoticon *)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end
