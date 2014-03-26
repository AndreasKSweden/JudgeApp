//
//  ViewController.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *SelectedSpices;
@property (weak, nonatomic) IBOutlet UISlider *Slider1;
@property (weak, nonatomic) IBOutlet UISlider *Slider2;
@property (weak, nonatomic) IBOutlet UISlider *Slider3;
@property (weak, nonatomic) IBOutlet UISlider *Slider4;
@property (weak, nonatomic) IBOutlet UISlider *Slider5;
@property (weak, nonatomic) IBOutlet UISlider *Slider6;
@property (weak, nonatomic) IBOutlet UISlider *Slider7;
@property (weak, nonatomic) IBOutlet UISlider *Slider8;
@property (weak, nonatomic) IBOutlet UISlider *Slider9;
@property (weak, nonatomic) IBOutlet UILabel *LblResult1;
@property (weak, nonatomic) IBOutlet UILabel *LblResult2;
@property (weak, nonatomic) IBOutlet UILabel *LblResult3;
@property (weak, nonatomic) IBOutlet UILabel *LblResult4;
@property (weak, nonatomic) IBOutlet UILabel *LblResult5;
@property (weak, nonatomic) IBOutlet UILabel *LblResult6;
@property (weak, nonatomic) IBOutlet UILabel *LblResult7;
@property (weak, nonatomic) IBOutlet UILabel *LblResult8;
@property (weak, nonatomic) IBOutlet UILabel *LblResult9;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance1;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance2;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance3;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance4;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance5;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance6;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance7;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance8;
@property (weak, nonatomic) IBOutlet UILabel *LblAppearance9;
@property (weak, nonatomic) IBOutlet UILabel *LblDisplaySelectedFish;
@property (weak, nonatomic) IBOutlet UILabel *LblDisplaySelectedCategory;
@property (weak, nonatomic) IBOutlet UIButton *SaveButton;
- (IBAction)OnSave:(id)sender;


@end
