//
//  WeatherModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 11..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "WeatherModel.h"
#import "DBConnector.h"

@implementation WeatherModel

@synthesize weather;

- (id)init {
    self = [super init];
    if(self){
        db = [[DBConnector getInstance] getDB];
        weather = [[Weather alloc] init];
    }
    return self;
}

- (void)create {
    char *err;
    
    if(_createQuery == nil){
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Weather' (w_id INTEGER PRIMARY KEY AUTOINCREMENT, w_name TEXT, w_src TEXT)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
    if(![self exist]){
        [self install];
    }
}

- (NSMutableArray *)select :(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Weather";
    if(where != nil){
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil)== SQLITE_OK){
        while (sqlite3_step(stmt)== SQLITE_ROW){
            Weather *w = [[Weather alloc] init];
            
            w.w_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            w.w_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            w.w_src = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            
            [list addObject:w];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

- (void)insertData :(Weather *)w {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Weather (w_name, w_src)VALUES ('%@', '%@')", w.w_name, w.w_src];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"INSERT Weather Failed!");
    }
    else {
        NSLog(@"INSERT Weather Success!");
    }
}

- (void)delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Weather";
    if(where != nil){
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"DELETE Weather Failed!");
    }
    else {
        NSLog(@"DELETE Weather Success!");
    }
}

- (void)drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Weather'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"DROP Weather Failed!");
    }
    else {
        NSLog(@"DROP Weather Success!");
    }
}

- (void)install {
    NSMutableArray *weatherList = [[NSMutableArray alloc] init];
    [weatherList addObject:[Weather weather:@"맥주" src:@"beer.png"]];
    [weatherList addObject:[Weather weather:@"영수중" src:@"bill.png"]];
    [weatherList addObject:[Weather weather:@"노잼" src:@"calm.png"]];
    [weatherList addObject:[Weather weather:@"사탕" src:@"candy.png"]];
    [weatherList addObject:[Weather weather:@"의자" src:@"chair.png"]];
    [weatherList addObject:[Weather weather:@"치킨" src:@"chicken.png"]];
    [weatherList addObject:[Weather weather:@"어려움" src:@"confused.png"]];
    [weatherList addObject:[Weather weather:@"미소" src:@"cool.png"]];
    [weatherList addObject:[Weather weather:@"썩소" src:@"cool-1.png"]];
    [weatherList addObject:[Weather weather:@"푸딩" src:@"creme-caramel.png"]];
    [weatherList addObject:[Weather weather:@"크로아상" src:@"croissant.png"]];
    [weatherList addObject:[Weather weather:@"훌쩍" src:@"crying-1.png"]];
    [weatherList addObject:[Weather weather:@"울음" src:@"crying.png"]];
    [weatherList addObject:[Weather weather:@"악마" src:@"devil.png"]];
    [weatherList addObject:[Weather weather:@"계란" src:@"egg.png"]];
    [weatherList addObject:[Weather weather:@"물고기" src:@"fish.png"]];
    [weatherList addObject:[Weather weather:@"꽃" src:@"flower.png"]];
    [weatherList addObject:[Weather weather:@"포크" src:@"fork.png"]];
    [weatherList addObject:[Weather weather:@"소녀" src:@"girl.png"]];
    [weatherList addObject:[Weather weather:@"햄버거" src:@"hamburguer.png"]];
    
    for(int i=0; i<weatherList.count; i++){
        [self insertData:[weatherList objectAtIndex:i]];
    }
}

- (BOOL)exist {
    return [self select:nil].count > 0;
}

- (Weather *)getSampleData {
    Weather *w = [[Weather alloc] init];
    w.w_id = @0;
    w.w_name = @"맑음";
    w.w_src = @"sunny.png";
    return w;
}

@end
