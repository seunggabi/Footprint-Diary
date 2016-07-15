//
//  DiaryModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryModel.h"
#import "DBConnector.h"
#import "HelperTool.h"

@implementation DiaryModel

@synthesize diary;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        diary = [[Diary alloc] init];
    }
    return self;
}

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Diary' (d_id INTEGER PRIMARY KEY AUTOINCREMENT, d_date TEXT, d_time INTEGER, d_w_id INTEGER, d_title TEXT, d_content TEXT, d_e_id INTEGER)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(NSMutableArray *) select :(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Diary";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Diary *d = [[Diary alloc] init];
            d.d_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            d.d_date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            d.d_time = [NSDate dateWithTimeIntervalSince1970:(const unsigned int)sqlite3_column_int(stmt, 2)];
            d.d_w_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 3)];
            d.d_title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            d.d_content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            d.d_e_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 6)];
            [list addObject:d];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData :(Diary *)d {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Diary (d_date, d_time, d_w_id, d_title, d_content, d_e_id) VALUES ('%@', '%f', '%@', '%@', '%@', '%@')", d.d_date, [[[HelperTool getInstance] stringToDate:d.d_date] timeIntervalSince1970], d.d_w_id, d.d_title, d.d_content, d.d_e_id];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Diary Failed!");
    }
    else {
        NSLog(@"INSERT Diary Success!");
    }
}

-(void) delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Diary";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Diary Failed!");
    }
    else {
        NSLog(@"DELETE Diary Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Diary'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP Diary Failed!");
    }
    else {
        NSLog(@"DROP Diary Success!");
    }
}

-(Diary *) getSampleData {
    Diary *d = [[Diary alloc] init];
    d.d_id = @0;
    d.d_date = @"2016-07-05";
    d.d_time = [[NSDate alloc] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    d.d_w_id = @0;
    d.d_title = @"좋은날";
    d.d_content = @"아이유";
    d.d_e_id = @0;
    return d;
}

-(NSMutableArray *) getTermList:(NSString *)sDate eDate:(NSString *)eDate {
    NSDate *s = [[HelperTool getInstance] stringToDate:sDate];
    NSDate *e = [[HelperTool getInstance] stringToDate:eDate];
    e = [e dateByAddingTimeInterval:60*60*24];
    
    NSString *where = [NSString stringWithFormat:@"d_time>='%f' AND d_time<'%f' ORDER BY d_date DESC", [s timeIntervalSince1970], [e timeIntervalSince1970]];
    NSMutableArray *list = [self select:where];
    return list;
}

@end
