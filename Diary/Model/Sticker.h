//
//  Sticker.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum color {
    BLACK,
    WHITE,
    RED,
    GREEN,
    BLUE,
    YELLOW,
    ORANGE,
    PINK
} COLOR;

@interface Sticker : NSObject

@property (strong, nonatomic) NSNumber *s_id;
@property (strong, nonatomic) NSString *s_date;
@property (strong, nonatomic) NSNumber *s_e_id;

+ (Sticker *)sticker:(NSString *)date color:(NSNumber *)color e_id:(NSNumber *)e_id;
- (NSDictionary *)getObj;

@end
 