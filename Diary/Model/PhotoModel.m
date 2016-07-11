//
//  PhotoModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "PhotoModel.h"
#import "DBConnector.h"

@implementation PhotoModel

@synthesize photo;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        photo = [[Photo alloc] init];
    }
    return self;
}

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Photo' (p_id INTEGER PRIMARY KEY AUTOINCREMENT, p_date TEXT, p_src TEXT)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(NSMutableArray *) select :(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Photo";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Photo *p = [[Photo alloc] init];
            
            p.p_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            p.p_date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            p.p_src = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            [list addObject:p];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData :(Photo *)p {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Photo (p_date, p_src) VALUES ('%@', '%@')", p.p_date, p.p_src];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Photo Failed!");
    }
    else {
        NSLog(@"INSERT Photo Success!");
    }
}

-(void) delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Photo";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Photo Failed!");
    }
    else {
        NSLog(@"DELETE Photo Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Photo'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP Photo Failed!");
    }
    else {
        NSLog(@"DROP Photo Success!");
    }
}

-(Photo *) getSampleData {
    Photo *p = [[Photo alloc] init];
    p.p_date = @"2016-07-05";
    p.p_src = @"test.png";
    p.p_id = @0;
    return p;
}

@end
