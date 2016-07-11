//
//  WeatherModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 11..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Weather.h"

@interface WeatherModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Weather *weather;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) create;
-(NSMutableArray *) select :(NSString *)where;
-(void) insertData:(Weather *)w;
-(void) delete :(NSString *)where;
-(void) drop;

-(void) install;
-(Weather *) getSampleData;

@end
