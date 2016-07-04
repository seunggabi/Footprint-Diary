//
//  UserModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 4..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <sqlite3.h>
#import <Foundation/Foundation.h>

@interface UserModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) NSDictionary *user;
@property (strong, nonatomic) NSString *createQuery;

-(void) setDB:(sqlite3 *)dbObj;
-(void) createUser;
-(NSDictionary *) getUser;
-(void) setUser:(NSDictionary *)user;
-(void) deleteUser;
-(void) dropUser;
-(NSDictionary *) getSampleData;

@end
