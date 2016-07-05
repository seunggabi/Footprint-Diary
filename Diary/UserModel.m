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

-(void) createUser {
    char *err;

    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'user' (u_name TEXT, sex CHAR(2), age INTEGER, height INTEGER, weight INTEGER, password TEXT, question TEXT, answer TEXT, skin_id INTEGER, timer INTEGER)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(User *) selectUser {
    NSString *selectQuery = @"SELECT * FROM user";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            user.u_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            user.sex = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            user.age = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 2)];
            user.height = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 3)];
            user.weight = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 4)];
            user.password = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            user.question = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
            user.answer = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
            user.skin_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 8)];
            user.timer = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 9)];
        }
        sqlite3_finalize(stmt);
    }
    return user;
}

-(void) insertUser:(User *)u {
    char *err;
    
    [self deleteUser];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO user VALUES ('%@', '%@', %@, %@, %@, '%@', '%@', '%@', '%@', '%@')", u.u_name, u.sex, u.age, u.height, u.weight, u.password, u.question, u.answer, u.skin_id, u.timer];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT User Failed!");
    }
    else {
        NSLog(@"INSERT User Success!");
    }
}

-(void) deleteUser {
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

-(void) dropUser {
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
    u.sex = @"M";
    u.age = @25;
    u.height = @172;
    u.weight = @83;
    u.password = @"1234";
    u.question = @"이 세상에서 제일 소중한 것은?";
    u.answer = @"나";
    u.skin_id = @0;
    u.timer = @1;
    return u;
}

@end
