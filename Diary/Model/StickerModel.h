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
-(void) createSticker;
-(NSMutableArray *) selectSticker :(NSString *)where;
-(void) insertSticker:(Sticker *)s;
-(void) deleteSticker;
-(void) dropSticker;

-(Sticker *) getSampleData;

@end
