//
//  DBConnector.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DBConnector.h"

@implementation DBConnector

-(NSString *) filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"database.sql"];
}

-(void) openDB {
    if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0, @"Database failed to open.");
        NSLog(@"Database Error");
    }
    else {
        NSLog(@"Database Open!");
    }
}

-(sqlite3 *) getDB {
    return db;
}

-(void) deleteTable:(NSString *)tableName {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"DELETE FROM %@", tableName];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"delete %@ Failed!", tableName);
    }
    else {
        NSLog(@"delete %@ success!", tableName);
    }
}

-(void) dropTable:(NSString *)tableName {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"DROP TABLE %@", tableName];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"drop %@ Failed!", tableName);
    }
    else {
        NSLog(@"drop %@ success!", tableName);
    }
}

@end
