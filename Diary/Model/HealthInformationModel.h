//
//  HealthInformationModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "HealthInformation.h"

@interface HealthInformationModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) HealthInformation *healthInfo;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) create;
-(NSMutableArray *) select :(NSString *)where;
-(void) insertData:(HealthInformation *)h;
-(void) delete :(NSString *)where;
-(void) drop;
-(void) install;
-(BOOL) exist;
-(HealthInformation *) getSampleData;
-(NSMutableArray *) getInfoTwo;

@end