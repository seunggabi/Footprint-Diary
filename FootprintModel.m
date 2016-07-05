//
//  FootprintModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintModel.h"

typedef enum weather {
    SUNNY=0,
    CLOUDY,
    RAINY,
    SNOWY
} WEATHER;

@implementation FootprintModel

@synthesize fp;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        fp = [[Footprint alloc] init];
    }
    return self;
}

-(void) createFootprint {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Footprint' (fp_id INTEGER PRIMARY KEY AUTOINCREMENT, fp_date TEXT, fp_time INTEGER, GPS_X INTEGER, GPS_Y INTEGER, address TEXT)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(NSMutableArray *) selectFootprint:(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *selectQuery = @"SELECT * FROM Footprint";
    if(where != nil) {
        selectQuery = [selectQuery stringByAppendingString:@" WHERE "];
        selectQuery = [selectQuery stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [selectQuery UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Footprint *f = [[Footprint alloc] init];
            f.fp_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 0)];
            f.fp_date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            f.fp_time = [NSDate dateWithTimeIntervalSince1970:(const unsigned int)sqlite3_column_text(stmt, 2)];
            f.GPS_X = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 3)];
            f.GPS_Y = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_text(stmt, 4)];
            f.address = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            [list addObject:f];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertFootprint:(Footprint *)f {
    char *err;
    
    //[self deleteFootprint];
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Footprint VALUES ('%@', '%@', '%@', '%@', '%@', '%@')", f.fp_id, f.fp_date, f.fp_time, f.GPS_X, f.GPS_Y, f.address];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Footprint Failed!");
    }
    else {
        NSLog(@"INSERT Footprint Success!");
    }
}

-(void) deleteFootprint {
    char *err;
    
    NSString *query = @"DELETE FROM Footprint";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Footprint Failed!");
    }
    else {
        NSLog(@"DELETE Footprint Success!");
    }
}

-(void) dropFootprint {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Footprint'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP Footprint Failed!");
    }
    else {
        NSLog(@"DROP Footprint Success!");
    }
}

-(Footprint *) getSampleData {
    Footprint *f = [[Footprint alloc] init];
    f.fp_id = @0;
    f.fp_date = @"2016-07-05";
    f.fp_time = [[NSDate alloc] init];
    f.GPS_X = @127.1945001;
    f.GPS_Y = @37.227448;
    f.address = @"우리집";
    return f;
}

@end
