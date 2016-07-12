//
//  ThemeModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 8..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "ThemeModel.h"
#import "DBConnector.h"

@implementation ThemeModel
@synthesize theme;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        theme = [[Theme alloc] init];
    }
    return self;
}

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Theme' (th_id INTEGER PRIMARY KEY AUTOINCREMENT, th_name TEXT, th_top TEXT, th_bottom TEXT, th_main TEXT, th_font TEXT)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
    if(![self exist]) {
        [self install];
    }
}

-(NSMutableArray *) select :(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Theme";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Theme *t = [[Theme alloc] init];
            
            t.th_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            t.th_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            t.th_top = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            t.th_bottom = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            t.th_main = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            t.th_font = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            
            [list addObject:t];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData :(Theme *)t {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Theme (th_name, th_top, th_bottom, th_main, th_font) VALUES ('%@', '%@', '%@', '%@', '%@')", t.th_name, t.th_top, t.th_bottom, t.th_main, t.th_font];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT theme Failed!");
    }
    else {
        NSLog(@"INSERT theme Success!");
    }
}

-(void) delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Theme";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE theme Failed!");
    }
    else {
        NSLog(@"DELETE Health Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Theme'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP theme Failed!");
    }
    else {
        NSLog(@"DROP Health Success!");
    }
}

-(void) install {
    NSMutableArray *themeList = [[NSMutableArray alloc] init];
    [themeList addObject:[Theme theme:@"테마이름" top:@"상단" main:@"메인" bottom:@"하단" font:@"폰트"]];
    
    for(int i=0; i<themeList.count; i++) {
        [self insertData:[themeList objectAtIndex:i]];
    }
}

-(BOOL) exist {
    return [self select:nil].count > 0;
}

-(Theme *) getSampleData {
    Theme *t = [[Theme alloc] init];
    t.th_name = @"Sample";
    t.th_top = @"0xFFFFFF";
    t.th_bottom = @"0x000000";
    t.th_main = @"0xFFFFFF";
    t.th_font = @"0x000000";
    return t;
}

@end
