//
//  ViewController.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "ViewController.h"
#import "AppearanceHandler.h"
#import "FishHandler.h"
#import "ImageHandler.h"
#import "ImageCache.h"
#import "ScoreHandler.h"

@interface ViewController ()
- (void) initFishList;
- (void) initAppearanceList;
-(Boolean) VerifyJudgeId:(int)Id;
-(NSInteger) getAppScore:(NSInteger)Tank;

@end


@implementation ViewController
@synthesize PicPath, scoreHandler;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CALayer *btnLayer = [_SaveButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    _appHandler = [[AppearanceHandler alloc] init];
    _fishHandler = [[FishHandler alloc] init];
    scoreHandler = [[ScoreHandler alloc] init];
    _saveSettings.enabled = YES;
    _serverIP.text = @"109.201.140.85";
    _judgeIndex = 0;
    _databaseName.text = @"Championship 2014";
    _SelectedSpices.text = @"Select Discus";
    _oldTankIndex = 1;
    _oldSlider1Value=1;
    _oldSlider2Value=1;
    _oldSlider3Value=1;
    _oldSlider4Value=1;
    _oldSlider5Value=1;
    _oldSlider6Value=1;
    _oldSlider7Value=1;
    _oldSlider8Value=1;
    _oldSlider9Value=1;
 /*
    //Debug
    _serverIP.hidden = YES;
    _databaseName.hidden = YES;
    _judgeID.enabled = NO;
    _LblServerIP.hidden = YES;
    _LblDatase.hidden = YES;
    _LblJudgeId.text = @"Welcome:";
    _saveSettings.hidden = YES;
    [self initFishList];
    [self initAppearanceList];
    [self initScoreList];
*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnSave:(id)sender {
    NSLog(@"Saving");
    NSArray * appArray;
    NSInteger score;
    NSString * sendUrl = @"http://";
    NSInteger appearanceIndex = 0;
    sendUrl = [sendUrl stringByAppendingString:_serverIP.text];
    NSString * strURL;
    
    appArray = [_appHandler getAppearanceList];
    for (int i = 0; i < appArray.count; i++)
    {
        appearanceIndex = [[[appArray objectAtIndex:i] valueForKey:@"index"] integerValue];

        switch (i) {
            case 0:
                score = [_LblResult1.text  integerValue];
            break;
            case 1:
                score = [_LblResult2.text  integerValue];
                break;
            case 2:
                score = [_LblResult3.text  integerValue];
                break;
            case 3:
                score = [_LblResult4.text  integerValue];
                break;
            case 4:
                score = [_LblResult5.text  integerValue];
                break;
            case 5:
                score = [_LblResult6.text  integerValue];
                break;
            case 6:
                score = [_LblResult7.text  integerValue];
                break;
            case 7:
                score = [_LblResult8.text  integerValue];
                break;
            case 8:
                score = [_LblResult9.text  integerValue];
                break;
            default:
                score = 0;
                break;
        }
        NSInteger present = [scoreHandler scorePresent: _m_fishIndex withApp:appearanceIndex];
        if ( present != 1)
        {
            strURL = [NSString stringWithFormat:@"http://109.201.140.85/championship/insert_get_score.php?Fish="];

            
        }
        else
        {
            strURL = [NSString stringWithFormat:@"http://109.201.140.85/championship/update_get_score.php?Fish="];

        }
            strURL = [strURL stringByAppendingString:[NSString stringWithFormat:@"%d",(int) _m_fishIndex]];
            strURL = [strURL stringByAppendingString:@"&Judge="];
            strURL = [strURL stringByAppendingString:[NSString stringWithFormat:@"%d",(int)_judgeIndex]];
            strURL = [strURL stringByAppendingString:@"&Appearance="];
            strURL = [strURL stringByAppendingString:[NSString stringWithFormat:@"%d",(int)appearanceIndex]];
            strURL = [strURL stringByAppendingString:@"&Score="];
            strURL = [strURL stringByAppendingString:[NSString stringWithFormat:@"%d",(int) score]];
            strURL = [strURL stringByAppendingString:@"&&pass=diskus2014"];
        

            NSData *dataURL= [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
            NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
            NSLog(@"%@", strResult);
            [scoreHandler retreiveData];
//             _LblLeftToJudge.Text = [NSString stringWithFormat:@"%d",[_fishHandler getLeftTojudge]];
        
    }
}

- (void) initFishList
{
    NSString * fishUrl = @"http://";
    NSInteger nbrOfFish = 0;
    
    fishUrl = [fishUrl stringByAppendingString:_serverIP.text];
    fishUrl = [fishUrl stringByAppendingString:@"/championship/get_json_fish_table_complete.php"];
    
    [_fishHandler setUrl:fishUrl];
    [_fishHandler retreiveData];
    nbrOfFish = [_fishHandler getNbrOfFishes];
    UIImage *image;
    for (int i = 0; i < nbrOfFish; i++)
    {
        NSString * imgUrl = [_fishHandler getPath: i];
        if (imgUrl != nil && imgUrl.length > 3)
        {
            
        
            
            
            // 1. Check the image cache to see if the image already exists. If so, then use it. If not, then download it.
          
            if ([[ImageCache sharedImageCache] DoesExist:imgUrl] == true)
            {
                image = [[ImageCache sharedImageCache] GetImage:imgUrl];
            }
            else
            {
                NSURL *url = [[NSURL alloc] initWithString:imgUrl];
                NSData *data = [[NSData alloc] initWithContentsOfURL:url];
                UIImage *image = [UIImage imageWithData:data];

            
                // Add the image to the cache
                if (image != nil)
                    [[ImageCache sharedImageCache] AddImage:imgUrl withImage:image];
                else
                    NSLog(@"failed %@", imgUrl);
            }
        }
        imgUrl = [_fishHandler getPath: 0];
        
        PicPath.text = imgUrl;
        if (imgUrl != nil && imgUrl.length > 3)
        {
            UIImage *image;
            image = [[ImageCache sharedImageCache] GetImage:imgUrl];
            _fishImage.image = image;
        }

    }
    
    _SelectedFishSlider.minimumValue = 1;
    _SelectedFishSlider.maximumValue = nbrOfFish;
    _SelectedFishSlider.continuous = YES;
    _LblDisplaySelectedFish.text = [NSString stringWithFormat:@"%d",(int)_SelectedFishSlider.value];
    
    _LblDisplaySelectedCategory.text = [_fishHandler getClass: (int)_SelectedFishSlider.value - 1];         
    
    
//    _LblLeftToJudge.Text = [NSString stringWithFormat:@"%d",[_fishHandler getLeftTojudge]];

}


- (void) initScoreList
{
    NSString * scoreUrl = @"http://";
    
    scoreUrl = [scoreUrl stringByAppendingString:_serverIP.text];
    scoreUrl = [scoreUrl stringByAppendingString:@"/championship/get_json_score_for_judge.php?Judge="];
    scoreUrl = [scoreUrl stringByAppendingString:[NSString stringWithFormat:@"%d",(int)_judgeIndex]];
    
    [scoreHandler setUrl:scoreUrl];
    
    NSString * addScoreUrl = @"http://";
    
    addScoreUrl = [addScoreUrl stringByAppendingString:_serverIP.text];
    addScoreUrl = [addScoreUrl stringByAppendingString:@"/championship/insert_get_score.php?"];
    
    [scoreHandler setAddScoreUrl:addScoreUrl];

    
    [scoreHandler retreiveData];
    
}


- (void) initAppearanceList
{
    NSString * appUrl = @"http://";
    NSArray * appArray;
    NSInteger nbrOfApp;
    appUrl = [appUrl stringByAppendingString:_serverIP.text];
    appUrl = [appUrl stringByAppendingString:@"/championship/get_json_appearance.php"];
    
    [_appHandler setUrl:appUrl];
    [_appHandler retreiveData];
    nbrOfApp = [_appHandler getNbrOfAppearances];
    if (nbrOfApp == 0)
    {
        NSLog(@"NbrOfAppearance is 0, ops!");
        return;
    }
    else
    {
        for (int i = nbrOfApp; i < 9; i++)
            switch (i) {
                case 0:
                    _Slider1.enabled = false;
                    _Slider1.hidden = true;
                    _LblAppearance1.hidden = true;
                    _LblResult1.hidden = true;
                    break;
                case 1:
                    _Slider2.enabled = false;
                    _Slider2.hidden = true;
                    _LblAppearance2.hidden = true;
                    _LblResult2.hidden = true;
                    break;
                case 2:
                    _Slider3.enabled = false;
                    _Slider3.hidden = true;
                    _LblAppearance3.hidden = true;
                    _LblResult3.hidden = true;
                    break;
                case 3:
                    _Slider4.enabled = false;
                    _Slider4.hidden = true;
                    _LblAppearance4.hidden = true;
                    _LblResult4.hidden = true;
                    break;
                case 4:
                    _Slider5.enabled = false;
                    _Slider5.hidden = true;
                    _LblAppearance5.hidden = true;
                    _LblResult5.hidden = true;
                    break;
                case 5:
                    _Slider6.enabled = false;
                    _Slider6.hidden = true;
                    _LblAppearance6.hidden = true;
                    _LblResult6.hidden = true;
                    break;
                case 6:
                    _Slider7.enabled = false;
                    _Slider7.hidden = true;
                    _LblAppearance7.hidden = true;
                    _LblResult7.hidden = true;
                    
                    break;
                case 7:
                    _Slider8.enabled = false;
                    _Slider8.hidden = true;
                    _LblAppearance8.hidden = true;
                    _LblResult8.hidden = true;
                    break;
                case 8:
                    _Slider9.enabled = false;
                    _Slider9.hidden = true;
                    _LblAppearance9.hidden = true;
                    _LblResult9.hidden = true;
                    break;
                    
                default:
                    break;
            }
    }
    _SelectedFishSlider.continuous = YES;
    appArray = [_appHandler getAppearanceList];
    for (int i = 0; i < appArray.count; i++)
    {
        switch (i) {
            case 0:
                _LblAppearance1.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider1.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider1.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult1.text = [NSString stringWithFormat:@"%d",(int)_Slider1.value];
                _Slider1.continuous = YES;
                
                break;
            case 1:
                _LblAppearance2.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider2.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider2.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult2.text = [NSString stringWithFormat:@"%d",(int)_Slider2.value];
                _Slider2.continuous = YES;
                break;
            case 2:
                _LblAppearance3.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider3.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider3.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult3.text = [NSString stringWithFormat:@"%d",(int)_Slider3.value];
                _Slider3.continuous = YES;
                break;
            case 3:
                _LblAppearance4.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider4.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider4.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult4.text = [NSString stringWithFormat:@"%d",(int)_Slider4.value];
                _Slider4.continuous = YES;
                break;
            case 4:
                _LblAppearance5.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider5.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider5.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult5.text = [NSString stringWithFormat:@"%d",(int)_Slider5.value];
                _Slider5.continuous = YES;
                break;
            case 5:
                _LblAppearance6.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider6.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider6.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult6.text = [NSString stringWithFormat:@"%d",(int)_Slider6.value];
                _Slider6.continuous = YES;
                break;
            case 6:
                _LblAppearance7.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider7.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider7.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult7.text = [NSString stringWithFormat:@"%d",(int)_Slider7.value];
                _Slider7.continuous = YES;
                break;
            case 7:
                _LblAppearance8.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider8.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider8.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult8.text = [NSString stringWithFormat:@"%d",(int)_Slider8.value];
                _Slider8.continuous = YES;
                break;
            case 8:
                _LblAppearance9.text = [[appArray objectAtIndex:i] valueForKey:@"name"];
                _Slider9.minimumValue = [[[appArray objectAtIndex:i] valueForKey:@"min"] integerValue];
                _Slider9.maximumValue = [[[appArray objectAtIndex:i] valueForKey:@"max"] integerValue];
                _LblResult9.text = [NSString stringWithFormat:@"%d",(int)_Slider9.value];
                _Slider9.continuous = YES;
                break;
                
            default:
                break;
        }
    }
}

-(Boolean)VerifyJudgeId:(int)Id
{
    NSString * judgesUrl = @"http://";
    NSMutableArray * jsonArray;

    
    judgesUrl = [judgesUrl stringByAppendingString:_serverIP.text];
    judgesUrl = [judgesUrl stringByAppendingString:@"/championship/verify_judges.php"];
    judgesUrl = [judgesUrl stringByAppendingString:@"?passwd="];
    judgesUrl = [judgesUrl stringByAppendingString:_judgeID.text];
    NSURL * url = [NSURL URLWithString: judgesUrl];
    NSData * data = [NSData dataWithContentsOfURL:url];
    //Definitions
    
    if (data == nil)
        return FALSE;
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options: kNilOptions error:nil];
    
    if (jsonArray.count == 0)
        return FALSE;
    
    if (jsonArray.count > 1)
    {
        NSLog(@"Ops!! to many judges received. Same password on several judges not acceptable");
        _judgeID.text = @"Not uniqe password.";
        return false;
    }
        NSString * name = [[jsonArray objectAtIndex:0] objectForKey:@"Name"];
        NSInteger index = [[[jsonArray objectAtIndex:0] objectForKey:@"counter"] integerValue];
        

    _judgeID.text = name;
    _judgeIndex = index;
    
    return TRUE;
}

- (IBAction)SaveSettings:(id)sender
{
    int judgeID = [_judgeID.text integerValue];
    if ([self VerifyJudgeId: judgeID]== TRUE)
    {
        _serverIP.hidden = YES;
        _databaseName.hidden = YES;
        _judgeID.enabled = NO;
        _LblServerIP.hidden = YES;
        _LblDatase.hidden = YES;
        _LblJudgeId.text = @"Welcome:";
        _saveSettings.hidden = YES;
        
        [self initScoreList];
        [self initFishList];
        [self initAppearanceList];
    }
}

- (IBAction)serverIPChanged:(id)sender {
    _saveSettings.enabled = YES;
}


- (IBAction)slider1Updated:(id)sender {
    if (_oldSlider1Value != (int)_Slider1.value)
    {
        _LblResult1.text = [NSString stringWithFormat:@"%d",(int)_Slider1.value];
        NSArray * appArray;
        appArray = [_appHandler getAppearanceList];
        NSInteger appIndex = [[[appArray objectAtIndex:0] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)Slider2Updated:(id)sender {
    if (_oldSlider2Value != (int)_Slider2.value)
    {
        _LblResult2.text = [NSString stringWithFormat:@"%d",(int)_Slider2.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:1] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)Slider3Updated:(id)sender {
    if (_oldSlider3Value != (int)_Slider3.value)
    {
        _LblResult3.text = [NSString stringWithFormat:@"%d",(int)_Slider3.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:2] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)Slider4Updated:(id)sender {
    if (_oldSlider4Value != (int)_Slider4.value)
    {
        _LblResult4.text = [NSString stringWithFormat:@"%d",(int)_Slider4.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:3] valueForKey:@"index"] integerValue];

    }

}

- (IBAction)Slider5Updated:(id)sender {
    if (_oldSlider5Value != (int)_Slider5.value)
    {
        _LblResult5.text = [NSString stringWithFormat:@"%d",(int)_Slider5.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:4] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)Slider6Updated:(id)sender {
    if (_oldSlider6Value != (int)_Slider6.value)
    {
        _LblResult6.text = [NSString stringWithFormat:@"%d",(int)_Slider6.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:5] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)Slider7Updated:(id)sender {
    if (_oldSlider7Value != (int)_Slider7.value)
    {
        _LblResult7.text = [NSString stringWithFormat:@"%d",(int)_Slider7.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:6] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)Slider8Updated:(id)sender {
    if (_oldSlider8Value != (int)_Slider8.value)
    {
        _LblResult8.text = [NSString stringWithFormat:@"%d",(int)_Slider8.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:7] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)Slider9Updated:(id)sender {
    if (_oldSlider9Value != (int)_Slider9.value)
    {
        _LblResult9.text = [NSString stringWithFormat:@"%d",(int)_Slider9.value];
    NSArray * appArray;
    appArray = [_appHandler getAppearanceList];
    NSInteger appIndex = [[[appArray objectAtIndex:8] valueForKey:@"index"] integerValue];

    }
}

- (IBAction)SelectedFishChanged:(id)sender {
    int selectedFish = (int)_SelectedFishSlider.value - 1;
    _LblDisplaySelectedFish.text = [NSString stringWithFormat:@"%d",selectedFish];
    NSString * imgUrl = [_fishHandler getPath: selectedFish];
    int tank;
    PicPath.text = imgUrl;
    if (imgUrl != nil && imgUrl.length > 3)
    {
        UIImage *image;
        image = [[ImageCache sharedImageCache] GetImage:imgUrl];
        _fishImage.image = image;
    }
    _LblDisplaySelectedCategory.text = [_fishHandler getClass: selectedFish];
    tank = [_fishHandler getTank: selectedFish];
    _TankNumber.text =[NSString stringWithFormat:@"%d",(int)tank];
    _m_fishIndex = [_fishHandler getFishIndex: selectedFish];
    if (_oldTankIndex != tank)
    {
        [self getAppScore: tank];
    }
}

-(NSInteger) getAppScore:(NSInteger)Tank
{
    NSArray * appArray;
    NSInteger score = 1;
    NSInteger appearanceIndex = 0;
    
    appArray = [_appHandler getAppearanceList];
    for (int i = 0; i < appArray.count; i++)
    {
        appearanceIndex = [[[appArray objectAtIndex:i] valueForKey:@"index"] integerValue];
        score = [scoreHandler getScore: _m_fishIndex withApp:appearanceIndex];
        switch (i) {
            case 0:
                
                _LblResult1.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider1.value = score;
                break;
            case 1:
                _LblResult2.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider2.value = score;
                break;
            case 2:
                _LblResult3.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider3.value = score;
                break;
            case 3:
                _LblResult4.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider4.value = score;
                break;
            case 4:
                _LblResult5.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider5.value = score;
                break;
            case 5:
                _LblResult6.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider6.value = score;
                break;
            case 6:
                _LblResult7.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider7.value = score;
                break;
            case 7:
                _LblResult8.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider8.value = score;
                break;
            case 8:
                _LblResult9.text = [NSString stringWithFormat:@"%d",(int)score];
                _Slider9.value = score;
                break;
            default:
                score = 0;
                break;
        }
    }
    return 0;
}
- (IBAction)Slider1Released:(id)sender {
/*    if (_oldSlider1Value != (int)_Slider1.value)
    {
        NSArray * appArray;
        appArray = [_appHandler getAppearanceList];
        NSInteger appIndex = [[[appArray objectAtIndex:0] valueForKey:@"index"] integerValue];
        
        if ([scoreHandler updateScore: _m_fishIndex withApp:appIndex :(int)_Slider1.value: _judgeIndex] == 0)
        {
            //           [scoreHandler addScore:_m_fishIndex withApp:appIndex :(NSInteger)_Slider1.value: _judgeIndex];
            [scoreHandler retreiveData];
        }
        
    }
    */
}
@end
