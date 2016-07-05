//
//  DBConnector.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBConnector : NSObject {
    sqlite3 *db;
}

+(DBConnector *) getInstance;
-(NSString *) filePath;
-(void) openDB;
-(sqlite3 *) getDB;
-(void) deleteTable:(NSString *)tableName;
-(void) dropTable:(NSString *)tableName;
-(void) updateTable:(NSString *)tableName data:(NSDictionary *)data where:(NSString *)where;

@end
