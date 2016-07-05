//
//  HealthModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Health.h"

@interface HealthModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Health *health;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) createHealth;
-(NSMutableArray *) selectHealth :(NSString *)where;
-(void) insertHealth:(Health *)h;
-(void) deleteHealth;
-(void) dropHealth;

-(Health *) getSampleData;
-(NSNumber *) getTodayNowCount;

@end
