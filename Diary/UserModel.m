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

-(void) createTable :(sqlite3 *)dbObj{
    char *err;
    db = dbObj;
    
    if(_createTableQuery == nil) {
        _createTableQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'user' ( name TEXT, sex CHAR(2), age INTEGER, height INTEGER, weight INTEGER, Password TEXT, question TEXT, answer TEXT"];
    }
    if(sqlite3_exec(db, [_createTableQuery UTF8String], NULL, NULL, &err) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Tabled failed to create.");
    }
    NSLog(@"test");
}

-(NSMutableArray *) getUser {
    NSString *selectQuery = @"SELECT FROM user";
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW){
            NSString *name = [NSString stringWithUTF8String:sqlite3_column_text(stmt, 0)];
            _user = @{@"name":name};
        }
        sqlite3_finalize(stmt);
    }
    return _user;
}

@end
