//
//  Diary.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Diary : NSObject

@property (strong, nonatomic) NSNumber *d_id;
@property (strong, nonatomic) NSString *d_date;
@property (strong, nonatomic) NSDate *d_time;
@property (strong, nonatomic) NSNumber *weather;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSNumber *e_id;

@end
