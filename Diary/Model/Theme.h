//
//  Theme.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 8..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Theme : NSObject

@property (strong, nonatomic) NSString *th_id;
@property (strong, nonatomic) NSString *th_top;
@property (strong, nonatomic) NSString *th_bottom;
@property (strong, nonatomic) NSString *th_main;
@property (strong, nonatomic) NSString *th_font;

-(NSDictionary *) getObj;

@end
