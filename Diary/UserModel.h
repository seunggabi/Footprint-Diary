//
//  UserModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <sqlite3.h>
#import <Foundation/Foundation.h>
#import "DBConnector.h"
#import "User.h"

@interface UserModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) createUser;
-(User *) selectUser;
-(void) insertUser:(User *)u;
-(void) deleteUser;
-(void) dropUser;

-(User *) getSampleData;

@end
