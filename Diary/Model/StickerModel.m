//
//  StickerModel.m
//  Sticker
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserves.
//

#import "StickerModel.h"
#import "DBConnector.h"

@implementation StickerModel

@synthesize sticker;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        sticker = [[Sticker alloc] init];
    }
    return self;
}

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Sticker' (s_id INTEGER PRIMARY KEY AUTOINCREMENT, s_date TEXT, s_color INTEGER, s_e_id INTEGER)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(NSMutableArray *) select:(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *selectQuery = @"SELECT * FROM Sticker";
    if(where != nil) {
        selectQuery = [selectQuery stringByAppendingString:@" WHERE "];
        selectQuery = [selectQuery stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Sticker *s = [[Sticker alloc] init];
            
            s.s_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            s.s_date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            s.s_color = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 2)];
            s.s_e_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 3)];
            [list addObject:s];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData:(Sticker *)s {
    char *err;
    
    //[self deleteSticker];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Sticker (s_date, s_color, s_e_id) VALUES ('%@', '%@', '%@')", s.s_date, s.s_color, s.s_e_id];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Sticker Failed!");
    }
    else {
        NSLog(@"INSERT Sticker Success!");
    }
}

-(void) delete {
    char *err;
    
    NSString *query = @"DELETE FROM Sticker";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Sticker Failed!");
    }
    else {
        NSLog(@"DELETE Sticker Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Sticker'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP Sticker Failed!");
    }
    else {
        NSLog(@"DROP Sticker Success!");
    }
}

-(Sticker *) getSampleData {
    Sticker *s = [[Sticker alloc] init];
    s.s_date = @"2016-07-05";
    s.s_color = @0;
    s.s_e_id = @0;
    return s;
}

@end
