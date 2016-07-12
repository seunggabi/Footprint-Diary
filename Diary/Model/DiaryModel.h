//
//  DiaryModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Diary.h"

@interface DiaryModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Diary *diary;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) create;
-(NSMutableArray *) select :(NSString *)where;
-(void) insertData :(Diary *)d;
-(void) delete :(NSString *)where;
-(void) drop;
-(Diary *) getSampleData;
-(NSMutableArray *) getTermList:(NSString *)sDate eDate:(NSString *)eDate;

@end
