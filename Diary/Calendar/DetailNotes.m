//
//  DetailNotes.m
//  SimpleMemo
//
//  Created by ssyong on 9/23/13.
//  Copyright (c) 2013 Memo. All rights reserved.
//

#import "DetailNotes.h"

@interface DetailNotes ()

@end

@implementation DetailNotes
@synthesize lblDay, lblTitle, tvContent, dicArray;
@synthesize btnEdit, btnSave;
@synthesize indexNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    lblTitle.text = [dicArray objectForKey:@"title"];
    lblDay.text = [dicArray objectForKey:@"date"];
    tvContent.text = [dicArray objectForKey:@"content"];
    tvContent.editable = FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(UIButton *)sender{
    //Using method dissmissModel View for back to last view
    [self dismissViewControllerAnimated:YES completion:nil];
}

//Function edit notes
- (IBAction)EditNote:(UIButton *)sender{
    //Set textview can edit
    tvContent.editable = TRUE;
    //Hidden button Edit
    btnEdit.hidden = TRUE;
    //Enable button Save
    btnSave.hidden = FALSE;
    //Set frame for textview for not overlap by keyboard
    [tvContent setFrame:CGRectMake(0, 75, 319, 170)];
    //Call keyboard
    [tvContent becomeFirstResponder];
}

//Save note after edit
- (IBAction)SaveNote:(UIButton *)sender{
    //set text view cannot edit
    tvContent.editable = FALSE;
    //enable button Edit
    btnEdit.hidden = FALSE;
    //Disable button Save
    btnSave.hidden = TRUE;
    
    //Init array with key notes
    NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"note"];
    //Get 1 object on array above
    NSDictionary *dataDic = [dataMutableArray objectAtIndex:indexNumber];
    NSString *dateString = [dataDic objectForKey:@"date"];
    NSString *dateTitle = [dataDic objectForKey:@"title"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:dateTitle,@"title",dateString,@"date",tvContent.text,@"content", nil];
    //Replace object after edit
    [dataMutableArray replaceObjectAtIndex:indexNumber withObject:dic];
    //Set full frame agian for textview
     [tvContent setFrame:CGRectMake(0, 75, 319, 347)];
    //Disable key board
    [tvContent resignFirstResponder];
    
}

//Delete 1 note
- (IBAction)deleteNote:(UIButton *)sender
{
    //Call alert view for notice user delete note
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Noctice"
                                                    message:@"Do you want to delete this file?"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:@"Cancel",nil];
    //Set tag for alert
    alert.tag = 1;
    [alert show];
   
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 1) {
        if(buttonIndex != 1) {//Same alert for delete note
            NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"note"];
            //Remove object contain current note from array
            [dataMutableArray removeObjectAtIndex:indexNumber];
            //Back to main view
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

@end
