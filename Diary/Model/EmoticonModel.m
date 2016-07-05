//
//  EmoticonModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "EmoticonModel.h"
#import "DBConnector.h"

@implementation EmoticonModel

@synthesize emoticon;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        emoticon = [[Emoticon alloc] init];
    }
    return self;
}

-(void) createEmoticon {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Emoticon' (e_id INTEGER PRIMARY KEY AUTOINCREMENT, e_name TEXT, e_src TEXT)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(NSMutableArray *) selectEmoticon:(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *selectQuery = @"SELECT * FROM Emoticon";
    if(where != nil) {
        selectQuery = [selectQuery stringByAppendingString:@" WHERE "];
        selectQuery = [selectQuery stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Emoticon *e = [[Emoticon alloc] init];
            
            e.e_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            e.e_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            e.e_src = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            [list addObject:e];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertEmoticon:(Emoticon *)e {
    char *err;
    
    //[self deleteEmoticon];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Emoticon (e_name, e_src) VALUES ('%@', '%@')", e.e_name, e.e_src];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Emoticon Failed!");
    }
    else {
        NSLog(@"INSERT Emoticon Success!");
    }
}

-(void) deleteEmoticon {
    char *err;
    
    NSString *query = @"DELETE FROM Emoticon";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Emoticon Failed!");
    }
    else {
        NSLog(@"DELETE Emoticon Success!");
    }
}

-(void) dropEmoticon {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Emoticon'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP Emoticon Failed!");
    }
    else {
        NSLog(@"DROP Emoticon Success!");
    }
}

-(Emoticon *) getSampleData {
    Emoticon *e = [[Emoticon alloc] init];
    e.e_name = @"2016-07-05";
    e.e_src = @"test.png";
    e.e_id = @0;
    return e;
}

@end
