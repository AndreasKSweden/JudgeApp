//
//  ViewController.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppearanceHandler.h"
#import "FishHandler.h"
#import "ImageCache.h"
#import "ScoreHandler.h"

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
@property (weak, nonatomic) IBOutlet UILabel *LblServerIP;
@property (weak, nonatomic) IBOutlet UILabel *LblJudgeId;
@property (weak, nonatomic) IBOutlet UILabel *LblDisplaySelectedFish;
@property (weak, nonatomic) IBOutlet UILabel *LblDisplaySelectedCategory;
@property (weak, nonatomic) IBOutlet UILabel *LblDatase;
@property (weak, nonatomic) IBOutlet UIButton *SaveButton;
- (IBAction)OnSave:(id)sender;
- (IBAction)SaveSettings:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *serverIP;
@property (weak, nonatomic) IBOutlet UITextField *databaseName;
@property (weak, nonatomic) IBOutlet UITextField *judgeID;
@property (weak, nonatomic) IBOutlet UIButton *saveSettings;

@property NSInteger leftToJudge;
@property (weak, nonatomic) IBOutlet UILabel *LblLeftToJudge;

- (IBAction)serverIPChanged:(id)sender;

@property (strong, nonatomic) AppearanceHandler * appHandler;
@property (strong, nonatomic) FishHandler * fishHandler;
@property (strong, nonatomic) ImageHandler * imageHandler;
@property (strong, nonatomic) ScoreHandler * scoreHandler;
@property (weak, nonatomic) IBOutlet UILabel *PicPath;

@property NSInteger m_fishIndex;
@property NSInteger judgeIndex;
@property NSInteger oldTankIndex;

- (IBAction)slider1Updated:(id)sender;
- (IBAction)Slider2Updated:(id)sender;
- (IBAction)Slider3Updated:(id)sender;
- (IBAction)Slider4Updated:(id)sender;
- (IBAction)Slider5Updated:(id)sender;
- (IBAction)Slider6Updated:(id)sender;
- (IBAction)Slider7Updated:(id)sender;
- (IBAction)Slider8Updated:(id)sender;
- (IBAction)Slider9Updated:(id)sender;
- (IBAction)SelectedFishChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *SelectedFishSlider;
@property (weak, nonatomic) IBOutlet UIImageView *fishImage;
@property (weak, nonatomic) IBOutlet UILabel *TankNumber;

@property NSInteger oldSlider1Value;
@property NSInteger oldSlider2Value;
@property NSInteger oldSlider3Value;
@property NSInteger oldSlider4Value;
@property NSInteger oldSlider5Value;
@property NSInteger oldSlider6Value;
@property NSInteger oldSlider7Value;
@property NSInteger oldSlider8Value;
@property NSInteger oldSlider9Value;
- (IBAction)Slider1Released:(id)sender;

@end
