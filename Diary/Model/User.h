//
//  User.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *u_name;
@property (strong, nonatomic) NSString *u_password;
@property (strong, nonatomic) NSString *u_question;
@property (strong, nonatomic) NSString *u_answer;
@property (strong, nonatomic) NSNumber *u_th_id;
@property (strong, nonatomic) NSNumber *u_timer;
@property (strong, nonatomic) NSString *u_tutorial;
@property (strong, nonatomic) NSString *u_lock;

-(NSDictionary *) getObj;

@end
