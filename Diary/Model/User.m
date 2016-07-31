//
//  User.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize u_name;
@synthesize u_password;
@synthesize u_question;
@synthesize u_answer;
@synthesize u_th_id;
@synthesize u_timer;
@synthesize u_tutorial;
@synthesize u_lock;

+ (User *)user:(NSString *)name password:(NSString *)password question:(NSString *)question answer:(NSString *)answer th_id:(NSNumber *)th_id timer:(NSNumber *)timer tutorial:(NSString *)tutorial lock:(NSString *)lock {
    User *u = [[User alloc] init];
    u.u_name = name;
    u.u_password = password;
    u.u_question = question;
    u.u_answer = answer;
    u.u_th_id = th_id;
    u.u_timer = timer;
    u.u_tutorial = tutorial;
    u.u_lock = lock;
    return u;
}

- (NSDictionary *)getObj {
    NSDictionary *obj = @{@"u_name":u_name, @"u_password":u_password, @"u_question":u_question, @"u_answer":u_answer, @"u_th_id":u_th_id, @"u_timer":u_timer, @"u_tutorial":u_tutorial, @"u_lock":u_lock};
    return obj;
}
@end
