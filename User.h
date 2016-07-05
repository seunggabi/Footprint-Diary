//
//  User.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSNumber *age;
@property (strong, nonatomic) NSNumber *height;
@property (strong, nonatomic) NSNumber *weight;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *answer;
@property (strong, nonatomic) NSNumber *skin_id;
@property (strong, nonatomic) NSNumber *timer;

-(NSDictionary *) getObj;

@end
