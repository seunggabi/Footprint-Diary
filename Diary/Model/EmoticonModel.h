//
//  EmoticonModel.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Emoticon.h"

@interface EmoticonModel : NSObject {
    sqlite3 *db;
}

@property (strong, nonatomic) Emoticon *emoticon;
@property (strong, nonatomic) NSString *createQuery;

-(id) init;
-(void) createEmoticon;
-(NSMutableArray *) selectEmoticon :(NSString *)where;
-(void) insertEmoticon:(Emoticon *)e;
-(void) deleteEmoticon;
-(void) dropEmoticon;

-(Emoticon *) getSampleData;

@end
