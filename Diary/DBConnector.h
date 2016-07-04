//
//  DBConnector.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBConnector : NSObject
@property (assign, nonatomic) sqlite3 *db;

-(NSString *) filePath;
-(void) openDB;

@end
