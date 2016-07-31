//
//  Photo.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (strong, nonatomic) NSNumber *p_id;
@property (strong, nonatomic) NSString *p_date;
@property (strong, nonatomic) NSString *p_src;

+ (Photo *)photo:(NSString *)date src:(NSString *)src;
- (NSDictionary *)getObj;

@end
