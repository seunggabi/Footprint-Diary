//
//  UserModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <sqlite3.h>
#import <Foundation/Foundation.h>

@interface UserModel : NSObject{
    sqlite3 *db;
}

@property (strong, nonatomic) NSMutableArray *user;
@property (strong, nonatomic) NSString *createTableQuery;

-(void) createTable :(sqlite3 *)dbObj;
-(NSMutableArray*) getUser;
-(void) setUser;

@end
