//
//  StickerModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Sticker.h"

@interface StickerModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Sticker *sticker;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) create;
-(NSMutableArray *) select :(NSString *)where;
-(void) insert:(Sticker *)s;
-(void) delete;
-(void) drop;

-(Sticker *) getSampleData;

@end
