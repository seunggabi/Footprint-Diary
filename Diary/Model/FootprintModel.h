//
//  FootprintModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <sqlite3.h>
#import <Foundation/Foundation.h>
#import "DBConnector.h"
#import "Footprint.h"

@interface FootprintModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Footprint *fp;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) create;
-(NSMutableArray *) select :(NSString *)where;
-(void) insertData :(Footprint *)u;
-(void) delete :(NSString *)where;
-(void) drop;

-(Footprint *) getSampleData;

@end
