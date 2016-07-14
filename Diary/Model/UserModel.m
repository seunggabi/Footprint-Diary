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

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
    }
    return self;
}

-(void) create {
    char *err;

    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'user' (u_name TEXT, u_password TEXT, u_question TEXT, u_answer TEXT, u_th_id INTEGER, u_timer INTEGER, u_tutorial CHAR(2), u_lock CHAR(2))"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
    if(![self exist]) {
        [self install];
    }
}

-(User *) select {
    User *u = nil;
    NSString *query = @"SELECT * FROM user";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            u = [[User alloc] init];
            u.u_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 0)];
            u.u_password = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            u.u_question = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            u.u_answer = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            u.u_th_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 4)];
            u.u_timer = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 5)];
            u.u_tutorial = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
            u.u_lock = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
        }
        sqlite3_finalize(stmt);
    }
    return u;
}

-(void) insertData:(User *)u {
    char *err;
    NSString *query = [NSString stringWithFormat:@"INSERT INTO user (u_name, u_password, u_question, u_answer, u_th_id, u_timer, u_tutorial, u_lock) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", u.u_name, u.u_password, u.u_question, u.u_answer, u.u_th_id, u.u_timer, u.u_tutorial, u.u_lock];
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
        NSAssert(0,@"DROP User Failed!");
    }
    else {
        NSLog(@"DROP User Success!");
    }
}

-(void) install {
    [self insertData:[self getSampleData]];
}

-(BOOL) exist {
    return [self select] != nil;
}

-(User *) getSampleData {
    User *u = [[User alloc] init];
    u.u_name = @"ooo의 일기장";
    u.u_password = @"";
    u.u_question = @"";
    u.u_answer = @"";
    u.u_th_id = @0;
    u.u_timer = @10;
    u.u_tutorial = @"Y";
    u.u_lock = @"N";
    return u;
}

@end
