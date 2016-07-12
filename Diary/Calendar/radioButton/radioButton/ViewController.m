//
//  ViewController.m
//  radioButton
//
//  Created by mju on 2016. 7. 12..
//  Copyright © 2016년 recipeGo. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize radioButton1, radioButton2, radioButton3, radioButton4;
- (void)viewDidLoad {
    [super viewDidLoad];
    [radioButton1 setImage:[UIImage imageNamed:@"selectedbtn.png"] forState:UIControlStateSelected];
    radioButton1.layer.cornerRadius=22;
    radioButton1.layer.masksToBounds=YES;
    radioButton1.tag = 1;
    [radioButton1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [radioButton2 setImage:[UIImage imageNamed:@"selectedbtn.png"] forState:UIControlStateSelected];
    radioButton2.layer.cornerRadius=22;
    radioButton2.layer.masksToBounds=YES;
    radioButton2.tag = 2;
    [radioButton2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [radioButton3 setImage:[UIImage imageNamed:@"selectedbtn.png"] forState:UIControlStateSelected];
    radioButton3.layer.cornerRadius=22;
    radioButton3.layer.masksToBounds=YES;
    radioButton3.tag = 3;
    [radioButton3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [radioButton4 setImage:[UIImage imageNamed:@"selectedbtn.png"] forState:UIControlStateSelected];
    radioButton4.layer.cornerRadius=22;
    radioButton4.layer.masksToBounds=YES;
    radioButton4.tag = 4;
    [radioButton4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)radioButtonClicked:(id)sender {
}
-(void)buttonClicked:(UIButton *)sender{
    switch(sender.tag)
    {
        case 1:
            if([radioButton1 isSelected] == YES){
                [radioButton1 setSelected:NO];
            }else{
                [radioButton1 setSelected:YES];
                [radioButton2 setSelected:NO];
                [radioButton3 setSelected:NO];
                [radioButton4 setSelected:NO];
                //수정할 것 집어넣기
            }
            break;
        case 2:
            if([radioButton2 isSelected] == YES){
                [radioButton2 setSelected:NO];
            }else{
                [radioButton2 setSelected:YES];
                [radioButton1 setSelected:NO];
                [radioButton3 setSelected:NO];
                [radioButton4 setSelected:NO];
            }
            break;
        case 3:
            if([radioButton3 isSelected] == YES){
                [radioButton3 setSelected:NO];
            }else{
                [radioButton3 setSelected:YES];
                [radioButton1 setSelected:NO];
                [radioButton2 setSelected:NO];
                [radioButton4 setSelected:NO];
            }
            break;
        case 4:
            if([radioButton4 isSelected] == YES){
                [radioButton4 setSelected:NO];
            }else{
                [radioButton4 setSelected:YES];
                [radioButton1 setSelected:NO];
                [radioButton2 setSelected:NO];
                [radioButton3 setSelected:NO];
            }
            break;
    }
}
@end
