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

-(void) setDB:(sqlite3 *)dbObj {
    db = dbObj;
}

-(void) createTable {
    char *err;

    if(_createTableQuery == nil) {
        _createTableQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'user' (name TEXT, sex CHAR(2), age INTEGER, height INTEGER, weight INTEGER, password TEXT, question TEXT, answer TEXT, skin_id INTEGER)"];
    }
    if(sqlite3_exec(db, [_createTableQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled failed to create.");
    }
}

-(NSDictionary *) getUser {
    NSString *selectQuery = @"SELECT * FROM user";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            NSString *name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            NSString *sex = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            NSString *age = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            NSString *height = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            NSString *weight = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            NSString *password = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            NSString *question = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
            NSString *answer = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
            NSString *skin_id = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
            _user = @{@"name":name, @"sex":sex, @"age":age, @"height":height, @"weight":weight, @"password":password, @"question":question, @"answer":answer, @"skin_id":skin_id};
        }
        sqlite3_finalize(stmt);
    }
    return _user;
}

-(void) setUser:(NSDictionary *)user {
    char *err;
    
    [self deleteUser];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO user VALUES ('%@', '%@', %d, %d, %d, '%@', '%@', '%@', '%@')", user[@"name"], user[@"sex"], [user[@"age"] intValue], [user[@"height"] intValue], [user[@"weight"] intValue], user[@"password"], user[@"question"], user[@"answer"], user[@"skin_id"]];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"setUser Failed!");
    }
    else {
        NSLog(@"setUser success!");
    }
}

-(void) deleteUser {
    char *err;
    
    NSString *query = @"DELETE FROM user";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"deleteUser Failed!");
    }
    else {
        NSLog(@"deleteUser success!");
    }
}

-(void) dropUser {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'user'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"dropUser Failed!");
    }
    else {
        NSLog(@"dropUser success!");
    }
}

-(NSDictionary *) getSampleData {
    NSString *name = @"김승갑";
    NSString *sex = @"M";
    NSString *age = @"25";
    NSString *height = @"172";
    NSString *weight = @"83";
    NSString *password = @"1234";
    NSString *question = @"이 세상에서 제일 소중한 것은?";
    NSString *answer = @"나";
    NSString *skin_id = @"0";
    return @{@"name":name, @"sex":sex, @"age":age, @"height":height, @"weight":weight, @"password":password, @"question":question, @"answer":answer, @"skin_id":skin_id};
}

@end
