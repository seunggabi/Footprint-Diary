//
//  HealthInformationModel.m
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "HealthInformationModel.h"
#import "DBConnector.h"

@implementation HealthInformationModel
@synthesize healthInfo;

-(id) init {
    self = [super init];
    if(self) {
        db = [[DBConnector getInstance] getDB];
        healthInfo = [[HealthInformation alloc] init];
    }
    return self;
}

-(void) create {
    char *err;
    
    if(_createQuery == nil) {
        _createQuery = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS 'Health_Information' (hi_id INTEGER PRIMARY KEY AUTOINCREMENT, hi_comment TEXT)"];
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
    NSString *query = @"SELECT * FROM Health_Information";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, nil) == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            HealthInformation *hi = [[HealthInformation alloc] init];
            
            hi.hi_id = [NSNumber numberWithUnsignedInteger:(const unsigned int)sqlite3_column_int(stmt, 0)];
            hi.hi_comment = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];

            [list addObject:hi];
        }
        sqlite3_finalize(stmt);
    }
    return list;
}

-(void) insertData :(HealthInformation *)hi {
    char *err;
    
    NSString *query = [NSString stringWithFormat:@"INSERT INTO Health_Information (hi_comment) VALUES ('%@')", hi.hi_comment];
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"INSERT HealthInfo Failed!");
    }
    else {
        NSLog(@"INSERT HealthInfo Success!");
    }
}

-(void) delete :(NSString *)where {
    char *err;
    
    NSString *query = @"DELETE FROM Health_Information";
    if(where != nil) {
        query = [query stringByAppendingString:@" WHERE "];
        query = [query stringByAppendingString:where];
    }
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DELETE HealthInfo Failed!");
    }
    else {
        NSLog(@"DELETE HealthInfo Success!");
    }
}

-(void) drop {
    char *err;
    
    NSString *query = @"DROP TABLE IF EXISTS 'Health_Information'";
    if(sqlite3_exec(db, [query UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"DROP HealthInfo Failed!");
    }
    else {
        NSLog(@"DROP HealthInfo Success!");
    }
}

-(void) install {
    NSMutableArray *healthInfoList = [[NSMutableArray alloc] init];
    [healthInfoList addObject:[HealthInformation healthInformation:@"걷기는 심박수 증가, 스트레스 해소, 혈압조절 등 다양한 효과를 얻을 수 있다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"사람이 한걸음을 걸었을 때 소모되는 열량은 약 3.3cal 이다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"아침에 많이 걷는 것만으로 기초대사량을 높일 수 있다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"하루에 2시간이상의 운동은 오히려 몸을 악화시킬 수 있다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"하루 수분섭취 권장량은 자신의 체중 X 33mL이다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"달리기보다 걷기가 혈압, 콜레스테롤, 심박수 조절에 보다 더 좋은 영향을 끼친다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"적어도 취침 3시간 전에는 카페인. 에너지음료, 기타 각성제 섭취를 삼가해야한다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"날마다 1만보를 꾸준히 걸으면 신체 나이가 여성은 4.6년 남성은 4.1년 더 젊어진다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"런닝머신보다 야외에서 뛰는 것이 열량 소모가 10%더 크다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"중량을 들어올리면서 근육이 성장하는 모습을 그려보는 것은 좋은 방법이다. "]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"운동을 할 때 충분한 휴식을 취하지 않으면 오버트레이닝이 발생하고 폐쇄 증후근에 빠질 수 있다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"하루에 체중 1Kg당 44.4Kcal를 섭취해야 이화작용을 피할 수 있다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"이화작용은 영양이 제대로 공급되지않았을 때 몸의 근육을 에너지원으로 사용하는 것이다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"마른 사람은 아무리 운동을 많이 해도 제대로 먹지못하면 아무 소용이 없다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"엎드려 자는 습관은 녹내장, 목 디스크를 유발할 수 있다."]];
    [healthInfoList addObject:[HealthInformation healthInformation:@"하루 나트륨 권장량은 2000mg이며 한국 라면의 평균 나트륨은 1800mg이다."]];
    
    for(int i=0; i<healthInfoList.count; i++) {
        [self insertData:[healthInfoList objectAtIndex:i]];
    }
}

-(BOOL) exist {
    return [self select:nil].count > 0;
}

-(HealthInformation *) getSampleData {
    HealthInformation *hi = [[HealthInformation alloc] init];
    hi.hi_comment = @"그냥 좋음";
    return hi;
}

-(NSMutableArray *) getInfoTwo {
    NSMutableArray *infoList = [self select:nil];
    NSMutableArray *infoTwo = [[NSMutableArray alloc] init];
    int one = rand()%infoList.count;
    int two = rand()%infoList.count;
    
    while(one == two) {
        two = rand()%infoList.count;
    }
    [infoTwo addObject:[infoList objectAtIndex:one]];
    [infoTwo addObject:[infoList objectAtIndex:two]];
    return infoTwo;
}

@end
