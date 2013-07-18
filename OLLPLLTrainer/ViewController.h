//
//  ViewController.h
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/16/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ColorPickerImageView;


@interface ViewController : UIViewController {
    IBOutlet ColorPickerImageView* _cubeImage;
}


@property (nonatomic, retain) ColorPickerImageView* cubeImage;

- (void) pickedColor:(UIColor*)color;
-(void)centerColor:(UIColor*)color;
-(void)topLeftColor:(UIColor *)color;

@end
