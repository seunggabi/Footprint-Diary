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
@property (strong, nonatomic) NSNumber *d_w_id;
@property (strong, nonatomic) NSString *d_title;
@property (strong, nonatomic) NSString *d_content;
@property (strong, nonatomic) NSNumber *d_e_id;

+ (Diary *)diary:(NSString *)date time:(NSDate *)time weather:(NSNumber *)weather title:(NSNumber *)title content:(NSNumber *)content e_id:(NSString *)e_id;
- (NSDictionary *)getObj;

@end
