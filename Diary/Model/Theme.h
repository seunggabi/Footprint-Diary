//
//  Theme.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 8..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Theme : NSObject

@property (strong, nonatomic) NSNumber *th_id;
@property (strong, nonatomic) NSString *th_name;
@property (strong, nonatomic) NSString *th_top;
@property (strong, nonatomic) NSString *th_main;
@property (strong, nonatomic) NSString *th_bottom;
@property (strong, nonatomic) NSString *th_font;

+(Theme *) theme:(NSString*)name top:(NSString *)top main:(NSString *)main bottom:(NSString *)bottom font:(NSString *)font;
-(NSDictionary *) getObj;

@end
