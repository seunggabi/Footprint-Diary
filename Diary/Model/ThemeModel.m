//
//  ThemeModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 8..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "ThemeModel.h"
#import "DBConnector.h"

@implementation ThemeModel
@synthesize theme;

- (id)init {
    self = [super init];
    if(self){
        db = [[DBConnector getInstance] getDB];
        theme = [[Theme alloc] init];
    }
    return self;
}

- (void)create {
    char *err;
    
    if(_createQuery == nil){
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Theme' (th_id INTEGER PRIMARY KEY AUTOINCREMENT, th_name TEXT, th_top TEXT, th_bottom TEXT, th_main TEXT, th_font TEXT)"];
    }
    if(sqlite3_exec(db, [_createQuery UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Tabled Failed to Create.");
    }
    if(![self exist]){
        [self install];
    }
}

- (NSMutableArray *)select :(NSString *)where {
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT * FROM Theme";
    if(where != nil){
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil)== SQLITE_OK){
        while (sqlite3_step(stmt)== SQLITE_ROW){
            Theme *t = [[Theme alloc] init];
            
            t.th_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            t.th_name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            t.th_top = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
            t.th_bottom = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
            t.th_main = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
            t.th_font = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
            
            [list addObject:t];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

- (void)insertData :(Theme *)t {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Theme (th_name, th_top, th_bottom, th_main, th_font)VALUES ('%@', '%@', '%@', '%@', '%@')", t.th_name, t.th_top, t.th_bottom, t.th_main, t.th_font];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"INSERT theme Failed!");
    }
    else {
        NSLog(@"INSERT theme Success!");
    }
}

- (void)delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Theme";
    if(where != nil){
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"DELETE theme Failed!");
    }
    else {
        NSLog(@"DELETE Health Success!");
    }
}

- (void)drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Theme'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err)!= SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"DROP theme Failed!");
    }
    else {
        NSLog(@"DROP Health Success!");
    }
}

- (void)install {
    NSMutableArray *themeList = [[NSMutableArray alloc] init];
    
    [themeList addObject:[Theme theme:@"tree.jpg" name:@"Tree" top:@"#aaaaaa" bottom:@"#aaaaaa" font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"balloon.jpg" name:@"Balloon" top:@"#ecdfbd" bottom:@"#ecdfbd"font:@"#444444"]];
    [themeList addObject:[Theme theme:@"bottle.jpg" name:@"Bottle" top:@"#98a590" bottom:@"#98a590"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"cactus.jpg" name:@"Cactus" top:@"#85c4b9" bottom:@"#85c4b9"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"city.jpg" name:@"City" top:@"#aaaaaa" bottom:@"#aaaaaa"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"cloud.jpg" name:@"Cloud" top:@"#aaaaaa" bottom:@"#aaaaaa"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"FerrisWheel.jpg" name:@"FerrisWheel" top:@"#69d2e7" bottom:@"#69d2e7"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"firework.jpg" name:@"Firework" top:@"#aaaaaa" bottom:@"#aaaaaa"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"flower.jpg" name:@"Flower" top:@"#e8928d" bottom:@"#e8928d"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"greek.jpg" name:@"Greek" top:@"#ffe6e6" bottom:@"#ffe6e6"font:@"#ff8080"]];
    [themeList addObject:[Theme theme:@"icecream.jpg" name:@"Icecream" top:@"#ffffff" bottom:@"#ffffff"font:@"#000000"]];
    [themeList addObject:[Theme theme:@"ocean.jpg" name:@"Ocean" top:@"#ffffff" bottom:@"#ffffff"font:@"#000000"]];
    [themeList addObject:[Theme theme:@"rainywindow.jpg" name:@"Rainywindow" top:@"#000000" bottom:@"#000000"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"sea.jpg" name:@"Sea" top:@"#28abe3" bottom:@"#28abe3"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"sea2.jpg" name:@"Sea2" top:@"#69d2e7" bottom:@"#69d2e7"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"skyline.jpg" name:@"Skyline" top:@"#000000" bottom:@"#000000"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"skyflower.jpg" name:@"Skyflower" top:@"#f0b09b" bottom:@"#f0b09b"font:@"#ffffff"]];
    [themeList addObject:[Theme theme:@"tower.jpg" name:@"Tower" top:@"#aaaaaa" bottom:@"#aaaaaa"font:@"#ffffff"]];
    

    
    for(int i=0; i<themeList.count; i++){
        [self insertData:[themeList objectAtIndex:i]];
    }
}

- (BOOL)exist {
    return [self select:nil].count > 0;
}

- (Theme *)getSampleData {
    Theme *t = [[Theme alloc] init];
    t.th_name = @"Sample";
    t.th_top = @"0xFFFFFF";
    t.th_bottom = @"0x000000";
    t.th_main = @"0xFFFFFF";
    t.th_font = @"0x000000";
    return t;
}

@end
