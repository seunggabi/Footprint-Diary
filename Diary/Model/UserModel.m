//
//  UserModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <sqlite3.h>
#import "UserModel.h"

@implementation UserModel

@synthesize user;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        user = [[User alloc] init];
    }
    return self;
}

-(void) create {
    char *err;

    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'user' (u_name TEXT, u_sex CHAR(2), u_age INTEGER, u_height INTEGER, u_weight INTEGER, u_password TEXT, u_question TEXT, u_answer TEXT, u_sk_id INTEGER, u_timer INTEGER)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(User *) select {
    NSString *selectQuery = @"SELECT * FROM user";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            user.u_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            user.u_sex = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            user.u_age = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 2)];
            user.u_height = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 3)];
            user.u_weight = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 4)];
            user.u_password = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            user.u_question = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
            user.u_answer = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
            user.u_sk_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 8)];
            user.u_timer = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 9)];
        }
        sqlite3_finalize(stmt);
    }
    return user;
}

-(void) insertUser:(User *)u {
    char *err;
    
    [self delete];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO user VALUES ('%@', '%@', %@, %@, %@, '%@', '%@', '%@', '%@', '%@')", u.u_name, u.u_sex, u.u_age, u.u_height, u.u_weight, u.u_password, u.u_question, u.u_answer, u.u_sk_id, u.u_timer];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT User Failed!");
    }
    else {
        NSLog(@"INSERT User Success!");
    }
}

-(void) delete {
    char *err;
    
    NSString *query = @"DELETE FROM user";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE User Failed!");
    }
    else {
        NSLog(@"DELETE User Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'user'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Drop User Failed!");
    }
    else {
        NSLog(@"Drop User Success!");
    }
}

-(User *) getSampleData {
    User *u = [[User alloc] init];
    u.u_name = @"김승갑";
    u.u_sex = @"M";
    u.u_age = @25;
    u.u_height = @172;
    u.u_weight = @83;
    u.u_password = @"1234";
    u.u_question = @"이 세상에서 제일 소중한 것은?";
    u.u_answer = @"나";
    u.u_sk_id = @0;
    u.u_timer = @1;
    return u;
}

@end
