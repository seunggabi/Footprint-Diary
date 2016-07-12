//
//  EmoticonModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "EmoticonModel.h"
#import "DBConnector.h"

@implementation EmoticonModel

@synthesize emoticon;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        emoticon = [[Emoticon alloc] init];
    }
    return self;
}

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Emoticon' (e_id INTEGER PRIMARY KEY AUTOINCREMENT, e_name TEXT, e_src TEXT)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
    if(![self exist]) {
        [self install];
    }
}

-(NSMutableArray *) select :(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Emoticon";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            Emoticon *e = [[Emoticon alloc] init];
            
            e.e_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            e.e_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            e.e_src = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            [list addObject:e];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData :(Emoticon *)e {
    char *err;

    NSString *query = [NSString stringWithFormat:@"INSERT INTO Emoticon (e_name, e_src) VALUES ('%@', '%@')", e.e_name, e.e_src];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT Emoticon Failed!");
    }
    else {
        NSLog(@"INSERT Emoticon Success!");
    }
}

-(void) delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Emoticon";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE Emoticon Failed!");
    }
    else {
        NSLog(@"DELETE Emoticon Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Emoticon'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP Emoticon Failed!");
    }
    else {
        NSLog(@"DROP Emoticon Success!");
    }
}

-(void) install {
    NSMutableArray *emoticonList = [[NSMutableArray alloc] init];
    [emoticonList addObject:[Emoticon emoticon:@"맥주" src:@"beer.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"영수중" src:@"bill.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"노잼" src:@"calm.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"사탕" src:@"candy.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"의자" src:@"chair.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"치킨" src:@"chicken.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"어려움" src:@"confused.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"미소" src:@"cool.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"썩소" src:@"cool-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"푸딩" src:@"creme-caramel.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"크로아상" src:@"croissant.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"훌쩍" src:@"crying-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"울음" src:@"crying.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"악마" src:@"devil.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"계란" src:@"egg.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"물고기" src:@"fish.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"꽃" src:@"flower.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"포크" src:@"fork.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"소녀" src:@"girl.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"햄버거" src:@"hamburguer.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"활짝웃음" src:@"happy-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"하하하" src:@"happy-2.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"스마일" src:@"happy-4.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"상큼" src:@"happy-5.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"당황" src:@"happy-6.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"씨익" src:@"happy-7.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"눈하트" src:@"happy-9.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"보통" src:@"happy-10.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"쏘쏘" src:@"happy-11.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"눈웃음" src:@"happy-12.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"높은의자" src:@"high-chair.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"핫케익" src:@"hot-cake.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"핫도그" src:@"hot-dog.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"아이스크림" src:@"ice-cream.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"키스" src:@"kiss-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"쪽" src:@"kiss.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"나이프" src:@"knife.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"웃픔" src:@"laughing.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"미트볼" src:@"meatballs.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"메뉴판" src:@"menu.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"밀크쉐이크" src:@"milkshake.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"콧수염" src:@"moustache.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"눈" src:@"muted-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"침묵" src:@"muted-2.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"눈치" src:@"muted.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"냅킨" src:@"napkins.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"긴장" src:@"nervous.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"파이" src:@"pie.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"피자" src:@"pizza.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"접시" src:@"plate.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"고기" src:@"pork.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"옷걸이" src:@"rack.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"레스토랑" src:@"restaurant.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"립스테이크" src:@"ribs.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"슬픔" src:@"sad-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"당혹" src:@"sad-2.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"우울" src:@"sad-3.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"때쓰기" src:@"sad-4.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"퀭함" src:@"sad-6.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"삐쭉삐쭉" src:@"sad-7.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"화남" src:@"sad-8.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"거짓울음" src:@"sad.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"소금" src:@"salt.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"샤우팅" src:@"shouting.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"아픔" src:@"sick.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"꼬치" src:@"skewer.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"스프" src:@"soup.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"스파게티" src:@"spaguetti.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"스푼" src:@"spoon.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"스테이크" src:@"steak.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"놀람" src:@"surprised-2.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"다크서클" src:@"surprised-3.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"무표정" src:@"surprised-4.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"멍때림" src:@"surprised.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"테이블" src:@"table.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"타코" src:@"taco.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"메롱" src:@"tongue-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"약올리기" src:@"tongue-2.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"웨이터" src:@"waiter.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"와인병" src:@"wine-1.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"와인잔" src:@"wine.png"]];
    [emoticonList addObject:[Emoticon emoticon:@"윙크" src:@"wink.png"]];

    for(int i=0; i<emoticonList.count; i++) {
        [self insertData:[emoticonList objectAtIndex:i]];
    }
}

-(BOOL) exist {
    return [self select:nil].count > 0;
}

-(Emoticon *) getSampleData {
    Emoticon *e = [[Emoticon alloc] init];
    e.e_name = @"sad";
    e.e_src = @"test.png";
    e.e_id = @0;
    return e;
}

@end
