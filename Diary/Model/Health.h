//
//  Health.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Health : NSObject

@property (strong, nonatomic) NSNumber *h_id;
@property (strong, nonatomic) NSString *h_date;
@property (strong, nonatomic) NSDate *h_time;
@property (strong, nonatomic) NSNumber *h_count;

+ (Health *)health:(NSString *)date time:(NSDate *)time count:(NSNumber *)count;
- (NSDictionary *)getObj;

@end
