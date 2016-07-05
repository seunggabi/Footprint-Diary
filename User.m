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
@synthesize sex;
@synthesize age;
@synthesize height;
@synthesize weight;
@synthesize password;
@synthesize question;
@synthesize answer;
@synthesize skin_id;
@synthesize timer;

-(NSDictionary *) getObj {
    NSDictionary *obj = @{@"u_name":u_name, @"sex":sex, @"age":age, @"height":height, @"weight":weight, @"password":password, @"question":question, @"answer":answer, @"skin_id":skin_id, @"timer":timer};
    return obj;
}
@end
