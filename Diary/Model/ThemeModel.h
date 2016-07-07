//
//  ThemeModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 8..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Theme.h"

@interface ThemeModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Theme *theme;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) create;
-(NSMutableArray *) select :(NSString *)where;
-(void) insertData:(Theme *)h;
-(void) delete :(NSString *)where;
-(void) drop;

-(Theme *) getSampleData;

@end
