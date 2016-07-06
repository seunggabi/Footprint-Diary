//
//  PhotoModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Photo.h"

@interface PhotoModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) create;
-(NSMutableArray *) select :(NSString *)where;
-(void) insert:(Photo *)p;
-(void) delete;
-(void) drop;

-(Photo *) getSampleData;

@end
