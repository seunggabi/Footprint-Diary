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
@synthesize u_sex;
@synthesize u_age;
@synthesize u_height;
@synthesize u_weight;
@synthesize u_password;
@synthesize u_question;
@synthesize u_answer;
@synthesize u_sk_id;
@synthesize u_timer;

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"u_name":u_name, @"u_sex":u_sex, @"u_age":u_age, @"u_height":u_height, @"u_weight":u_weight, @"u_password":u_password, @"u_question":u_question, @"u_answer":u_answer, @"u_sk_id":u_sk_id, @"u_timer":u_timer};
    return obj;
}
@end
