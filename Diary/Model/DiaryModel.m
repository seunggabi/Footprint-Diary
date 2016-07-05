//
//  DiaryModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DiaryModel.h"
#import "DBConnector.h"

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

-(void) createDiary {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Diary' (d_id INTEGER PRIMARY KEY AUTOINCREMENT, d_date TEXT, d_time INTEGER, weather INTEGER, title TEXT, content TEXT, e_id INTEGER)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(NSMutableArray *) selectDiary:(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *selectQuery = @"SELECT * FROM Diary";
    if(where != nil) {
        selectQuery = [selectQuery stringByAppendingString:@" WHERE "];
        selectQuery = [selectQuery stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Diary *d = [[Diary alloc] init];
            
            d.d_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            d.d_date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            d.d_time = [NSDate dateWithTimeIntervalSince1970:(const unsigned int)sqlite3_column_int(stmt, 2)];
            d.weather = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 3)];
            d.title = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            d.content = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            d.e_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 6)];
            [list addObject:d];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertDiary:(Diary *)d {
    char *err;
    
    //[self deleteDiary];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Diary (d_data, d_time, weather, title, content, e_id) VALUES ('%@', '%f', '%@', '%@', '%@', '%@')", d.d_date, [d.d_time timeIntervalSince1970], d.weather, d.title, d.content, d.e_id];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Diary Failed!");
    }
    else {
        NSLog(@"INSERT Diary Success!");
    }
}

-(void) deleteDiary {
    char *err;
    
    NSString *query = @"DELETE FROM Diary";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Diary Failed!");
    }
    else {
        NSLog(@"DELETE Diary Success!");
    }
}

-(void) dropDiary {
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
    d.d_time = [[NSDate alloc] init];
    d.weather = @0;
    d.title = @"좋은날";
    d.content = @"아이유";
    d.e_id = @0;
    return d;
}
@end
