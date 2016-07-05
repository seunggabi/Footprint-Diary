//
//  Footprint.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 5..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Footprint : NSObject

@property (strong, nonatomic) NSNumber *fp_id;
@property (strong, nonatomic) NSString *fp_date;
@property (strong, nonatomic) NSDate *fp_time;
@property (strong, nonatomic) NSNumber *GPS_X;
@property (strong, nonatomic) NSNumber *GPS_Y;
@property (strong, nonatomic) NSString *address;

-(NSDictionary *) getObj;

@end
