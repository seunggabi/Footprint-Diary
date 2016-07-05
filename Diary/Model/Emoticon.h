//
//  Emoticon.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 6..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Emoticon : NSObject

@property (strong, nonatomic) NSNumber *e_id;
@property (strong, nonatomic) NSString *e_name;
@property (strong, nonatomic) NSString *e_src;

-(NSDictionary *) getObj;

@end
