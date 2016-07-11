//
//  Weather.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 11..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (strong, nonatomic) NSNumber *w_id;
@property (strong, nonatomic) NSString *w_name;
@property (strong, nonatomic) NSString *w_src;

+(Weather *) weather:(NSString *)name src:(NSString *)src;
-(NSDictionary *) getObj;

@end
