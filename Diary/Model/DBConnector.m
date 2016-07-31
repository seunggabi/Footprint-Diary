//
//  DBConnector.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "DBConnector.h"

@implementation DBConnector

+ (DBConnector *)getInstance {
    static DBConnector *instance = nil;
    
    if(instance == nil){
        instance = [[DBConnector alloc] init];
        [instance openDB];
    }
    return instance;
}

- (NSString *)filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"database.sql"];
}

- (void)openDB {
    if(sqlite3_open([[self filePath] UTF8String], &db)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0, @"Database failed to open.");
        NSLog(@"Database Error");
    }
    else {
        NSLog(@"Database Open!");
    }
}

- (sqlite3 *)getDB {
    return db;
}

- (void)deleteTable :(NSString *)tableName {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"DELETE FROM %@", tableName];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"DELETE %@ Failed!", tableName);
    }
    else {
        NSLog(@"DELETE %@ success!", tableName);
    }
}

- (void)dropTable :(NSString *)tableName {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"DROP TABLE %@", tableName];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"DROP %@ Failed!", tableName);
    }
    else {
        NSLog(@"DROP %@ success!", tableName);
    }
}

- (void)updateTable :(NSString *)tableName data:(NSDictionary *)data where:(NSString *)where {
    char *err;
    NSString *query = [NSString stringWithFormat:@"UPDATE %@ SET ", tableName];
    BOOL firstCheck = TRUE;
    for(NSString *key in data)
    {
        if(!firstCheck)
            query = [query stringByAppendingString:@","];
        query = [query stringByAppendingString:key];
        query = [query stringByAppendingString:[NSString stringWithFormat:@"='%@'", data[key]]];
        firstCheck = FALSE;
    }
    if(where != nil){
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"UPDATE %@ Failed!",tableName);
    }
    else {
        NSLog(@"UPDATE %@ success!", tableName);
    }
}

- (void)queryExecute:(NSString *)query {
    char *err;
    
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Query Failed!");
    }
    else {
        NSLog(@"Query Success!!");
    }

}

@end
