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

@interface ViewController ()
- (void) initFishList;
- (void) initAppearanceList;

@end


@implementation ViewController
@synthesize PicPath;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CALayer *btnLayer = [_SaveButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    _appHandler = [[AppearanceHandler alloc] init];
    _fishHandler = [[FishHandler alloc] init];
    _saveSettings.enabled = YES;
    _serverIP.text = @"109.201.140.85";
    _databaseName.text = @"Championship 2014";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnSave:(id)sender {
    NSLog(@"Saving");
    
    NSString * sendUrl = @"http://";
    
    sendUrl = [sendUrl stringByAppendingString:_serverIP.text];/*
    sendUrl = [sendUrl stringByAppendingString:@"/championship/insert_score.php?Fish=2&Judge=1&Appearance=6&Score=4&pass=diskus2014"];
   // sendUrl = [sendUrl stringByAppendingString:];
    
    NSURL *url = [NSURL URLWithString:sendUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSError *error;
    NSURLResponse *response;
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error)
    {
            NSLog(@"Error code %d", error.code);
    }
     */
    /*
    NSString * post = [[NSString alloc] initWithFormat:@"&myvariable=%@", @"Fish=2&Judge=1&Appearance=6&Score=4&pass=diskus2014"];
    NSData * postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:NO];
    NSString * postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:sendUrl]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (conn) NSLog(@"Connection Successful");*/
    
    NSString * strURL = [NSString stringWithFormat:@"http://109.201.140.85/championship/add_score.php?Fish=2&Judge=1&Appearance=6&Score=4&pass=diskus2014"];
    NSData *dataURL= [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", strResult);
    
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
                    [[ImageCache sharedImageCache] AddImage:imgUrl :image];
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
- (IBAction)SaveSettings:(id)sender
{
    
    [self initFishList];
    [self initAppearanceList];
    
}

- (IBAction)serverIPChanged:(id)sender {
    _saveSettings.enabled = YES;
}


- (IBAction)slider1Updated:(id)sender {
    _LblResult1.text = [NSString stringWithFormat:@"%d",(int)_Slider1.value];

}

- (IBAction)Slider2Updated:(id)sender {
    _LblResult2.text = [NSString stringWithFormat:@"%d",(int)_Slider2.value];
}

- (IBAction)Slider3Updated:(id)sender {
    _LblResult3.text = [NSString stringWithFormat:@"%d",(int)_Slider3.value];
}

- (IBAction)Slider4Updated:(id)sender {
    _LblResult4.text = [NSString stringWithFormat:@"%d",(int)_Slider4.value];
}

- (IBAction)Slider5Updated:(id)sender {
    _LblResult5.text = [NSString stringWithFormat:@"%d",(int)_Slider5.value];
}

- (IBAction)Slider6Updated:(id)sender {
    _LblResult6.text = [NSString stringWithFormat:@"%d",(int)_Slider6.value];
}

- (IBAction)Slider7Updated:(id)sender {
    _LblResult7.text = [NSString stringWithFormat:@"%d",(int)_Slider7.value];
}

- (IBAction)Slider8Updated:(id)sender {
    _LblResult8.text = [NSString stringWithFormat:@"%d",(int)_Slider8.value];
}

- (IBAction)Slider9Updated:(id)sender {
    _LblResult9.text = [NSString stringWithFormat:@"%d",(int)_Slider9.value];
}

- (IBAction)SelectedFishChanged:(id)sender {
    _LblDisplaySelectedFish.text = [NSString stringWithFormat:@"%d",(int)_SelectedFishSlider.value];
    NSString * imgUrl = [_fishHandler getPath: (int)_SelectedFishSlider.value - 1];
    
    PicPath.text = imgUrl;
    if (imgUrl != nil && imgUrl.length > 3)
    {
        UIImage *image;
        image = [[ImageCache sharedImageCache] GetImage:imgUrl];
        _fishImage.image = image;
    }
    
    
}
@end
