//
//  HealthInformation.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthInformation : NSObject

@property (strong, nonatomic) NSNumber *hi_id;
@property (strong, nonatomic) NSNumber *hi_type;
@property (strong, nonatomic) NSString *hi_title;
@property (strong, nonatomic) NSString *hi_comment;
@property (strong, nonatomic) NSString *hi_link;

-(NSDictionary *) getObj;

@end
