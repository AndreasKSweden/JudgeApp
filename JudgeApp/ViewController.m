//
//  ViewController.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CALayer *btnLayer = [_SaveButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnSave:(id)sender {
}
@end
