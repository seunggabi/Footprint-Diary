//
//  NewNoteView.m
//  SimpleMemo
//
//  Created by ssyong on 9/23/13.
//  Copyright (c) 2013 Memo. All rights reserved.
//

#import "NewNoteView.h"

@interface NewNoteView ()

@end

@implementation NewNoteView
@synthesize btnSave, btnBack;
@synthesize tfTitle, tvContent;
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
    [tfTitle becomeFirstResponder];
    [tvContent setFrame:CGRectMake(0, 75, 319, 167)];

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

- (IBAction)SaveNote:(UIButton *)sender{
    if ([tfTitle.text length]!=0) {//Title is  existed
        //Disable Keyboard
        [tvContent resignFirstResponder];
        //Set Frame of textview when edit note
        [tvContent setFrame:CGRectMake(0, 77, 319, 381)];
        //Get array note from local file defaults
        NSMutableArray *dataMutableArray = [[NSUserDefaults standardUserDefaults]mutableArrayValueForKey:@"note"];
        // get current date
        NSDate* today = [NSDate date];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:today];
        NSInteger iYear = [dateComponents year];
        NSInteger iMonth = [dateComponents month];
        NSInteger iDay = [dateComponents day];
        NSString *dateString = [NSString stringWithFormat:@"%d.%d.%d",iYear, iMonth, iDay];
        NSString *dateTitle = tfTitle.text;
        //Save new content, date, title of Note to new index of array.
        [dataMutableArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:dateTitle,@"title",dateString,@"date",tvContent.text,@"content", nil]];
        //Back to main view
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else//Title is not existed
    {
        //Call alert view for notice user add title note
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Noctice"
                                                        message:@"You must type your note title!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
       
        [alert show];
     
    }
    
    
}

@end
