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
@property (strong, nonatomic) NSString *hi_comment;

-(NSDictionary *) getObj;

@end
