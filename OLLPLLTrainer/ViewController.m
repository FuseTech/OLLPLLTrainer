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



@end
