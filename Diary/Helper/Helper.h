//
//  Functions.h
//  Diary
//
//  Created by 김승갑 on 2016. 7. 9..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DaumMap/MTMapReverseGeoCoder.h>

@interface Helper : NSObject

@property (strong, nonatomic) NSString *apiKey;
@property (strong, nonatomic) NSString *getAddressURL;

+(Helper *) getInstance;
-(NSString *) getToday;
-(NSDate *) getDate;

@end 