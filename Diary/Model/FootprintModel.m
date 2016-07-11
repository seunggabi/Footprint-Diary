//
//  FootprintModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "FootprintModel.h"

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

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Footprint' (fp_id INTEGER PRIMARY KEY AUTOINCREMENT, fp_date TEXT, fp_time INTEGER, fp_GPS_X DOUBLE, fp_GPS_Y DOUBLE, fp_address TEXT, fp_h_count INTEGER)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
}

-(NSMutableArray *) select :(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Footprint";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Footprint *f = [[Footprint alloc] init];
            f.fp_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            f.fp_date = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            f.fp_time = [NSDate dateWithTimeIntervalSince1970:(const unsigned int)sqlite3_column_int(stmt, 2)];
            f.fp_GPS_X = [NSNumber numberWithDouble:(double)sqlite3_column_double(stmt, 3)];
            f.fp_GPS_Y = [NSNumber numberWithDouble:(double)sqlite3_column_double(stmt, 4)];
            f.fp_address = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            f.fp_h_count = [NSNumber numberWithDouble:(double)sqlite3_column_double(stmt, 6)];

            [list addObject:f];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData:(Footprint *)f {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Footprint (fp_date, fp_time, fp_GPS_X, fp_GPS_Y, fp_address, fp_h_count) VALUES ('%@', '%f', '%@', '%@', '%@', '%@')", f.fp_date, [f.fp_time timeIntervalSince1970], f.fp_GPS_X, f.fp_GPS_Y, f.fp_address, f.fp_h_count];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Footprint Failed!");
    }
    else {
        NSLog(@"INSERT Footprint Success!");
    }
}

-(void) delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Footprint";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }

    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Footprint Failed!");
    }
    else {
        NSLog(@"DELETE Footprint Success!");
    }
}

-(void) drop {
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
    f.fp_date = @"2016-07-05";
    f.fp_time = [[NSDate alloc] initWithTimeInterval:60*60*9 sinceDate:[NSDate date]];
    f.fp_GPS_X = @127.1945001;
    f.fp_GPS_Y = @37.227448;
    f.fp_address = @"우리집";
    f.fp_h_count = @12345;
    return f;
}

-(NSMutableArray *) getDateList:(NSString *)date {
    NSMutableArray *list = [self select:[NSString stringWithFormat:@"fp_date='%@'", date]];
    return list;
}

@end
