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

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"u_name":u_name, @"u_password":u_password, @"u_question":u_question, @"u_answer":u_answer, @"u_th_id":u_th_id, @"u_timer":u_timer, @"u_tutorial":u_tutorial};
    return obj;
}
@end
