//
//  DetailNotes.h
//  SimpleMemo
//
//  Created by ssyong on 9/23/13.
//  Copyright (c) 2013 Memo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNotes : UIViewController
{
    
}
//Index note current
@property int indexNumber;

//Element on this view
@property (retain, nonatomic) IBOutlet UILabel  *lblTitle;
@property (retain, nonatomic) IBOutlet UILabel  *lblDay;
@property (retain, nonatomic) IBOutlet UITextView  *tvContent;
@property (retain, nonatomic) IBOutlet NSDictionary *dicArray;

@property (retain, nonatomic) IBOutlet UIButton  *btnEdit;
@property (retain, nonatomic) IBOutlet UIButton  *btnSave;

//Action when click on button of UI
- (IBAction)back:(UIButton *)sender;
- (IBAction)EditNote:(UIButton *)sender;
- (IBAction)SaveNote:(UIButton *)sender;
- (IBAction)deleteNote:(UIButton *)sender;


@end
