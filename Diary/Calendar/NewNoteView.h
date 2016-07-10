//
//  NewNoteView.h
//  SimpleMemo
//
//  Created by ssyong on 9/23/13.
//  Copyright (c) 2013 Memo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewNoteView : UIViewController
{
    
}
//Index current note
@property int indexNumber;
//Element on view
@property (retain, nonatomic) IBOutlet UIButton *btnSave;
@property (retain, nonatomic) IBOutlet UIButton *btnBack;
@property (retain, nonatomic) IBOutlet UITextField *tfTitle;
@property (retain, nonatomic) IBOutlet UITextView *tvContent;

//Action when click button
- (IBAction)back:(UIButton *)sender;
- (IBAction)SaveNote:(UIButton *)sender;
@end
