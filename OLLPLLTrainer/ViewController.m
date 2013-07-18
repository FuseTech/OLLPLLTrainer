//
//  ViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/16/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "ViewController.h"
#import "OverlayView.h"
#import "ColorPickerImageView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UIView *averageColorView;
@property (weak, nonatomic) IBOutlet UIView *topLeftView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _cubeImage.pickedColorDelegate = self;
}

-(void)viewDidAppear:(BOOL)animated {
    /*
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0,0,SCREEN_WIDTH, SCREEN_HEIGTH)];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraOverlayView = overlay;
    [self presentViewController:picker animated:YES completion:nil];
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pickedColor:(UIColor *)color {
    self.testView.backgroundColor = color;
    
}
-(void)centerColor:(UIColor *)color {
    self.averageColorView.backgroundColor = color;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
    
        [color getRed:&red green:&green blue:&blue alpha:&alpha];
        red = red * 255;
        green = green *255;
        blue = blue *255;
    
    
}

-(void)topLeftColor:(UIColor *)color {
    self.topLeftView.backgroundColor = color;
    
}


@end
