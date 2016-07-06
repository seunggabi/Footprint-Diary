//
//  HealthModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "HealthModel.h"
#import "DBConnector.h"

@implementation HealthModel

@synthesize health;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        health = [[Health alloc] init];
    }
    return self;
}

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Health' (h_id INTEGER PRIMARY KEY AUTOINCREMENT, h_date TEXT, h_time INTEGER, h_count INTEGER)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Creath.");
    }
}

-(NSMutableArray *) select:(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *selectQuery = @"SELECT * FROM Health";
    if(where != nil) {
        selectQuery = [selectQuery stringByAppendingString:@" WHERE "];
        selectQuery = [selectQuery stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Health *h = [[Health alloc] init];
            
            h.h_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            h.h_date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            h.h_time = [NSDate dateWithTimeIntervalSince1970:(const unsigned int)sqlite3_column_int(stmt, 2)];
            h.h_count = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 3)];
            [list addObject:h];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData:(Health *)h {
    char *err;
    
    //[self deleteHealth];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Health (h_date, h_time, h_count) VALUES ('%@', '%f', '%d')", h.h_date, [h.h_time timeIntervalSince1970], [[self getTodayNowCount] intValue]+1];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Health Failed!");
    }
    else {
        NSLog(@"INSERT Health Success!");
    }
}

-(void) delete {
    char *err;
    
    NSString *query = @"DELETE FROM Health";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Health Failed!");
    }
    else {
        NSLog(@"DELETE Health Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Health'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP Health Failed!");
    }
    else {
        NSLog(@"DROP Health Success!");
    }
}

-(Health *) getSampleData {
    Health *h = [[Health alloc] init];
    h.h_date = @"2016-07-06";
    h.h_time = [[NSDate alloc] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    h.h_id = @0;
    h.h_count = @123;
    return h;
}

-(NSNumber *) getTodayNowCount {
    NSDate *date = [[NSDate alloc] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:date];
    NSString *countQuery = [NSString stringWithFormat:@"SELECT count(*) FROM Health WHERE date='%@'",today];
    NSNumber *todayCount;
    
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [countQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            todayCount = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
        }
        sqlite3_finalize(stmt);
    }
    return todayCount;
}

@end
