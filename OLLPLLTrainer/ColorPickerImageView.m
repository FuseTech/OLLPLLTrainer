//
//  ColorPickerImageView.m
//  ColorPicker
//
//  Created by markj on 3/6/09.
//  Copyright 2009 Mark Johnson. All rights reserved.
//

#import "ColorPickerImageView.h"
#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/CoreAnimation.h>

@implementation ColorPickerImageView

@synthesize lastColor;
@synthesize pickedColorDelegate;


- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	if (self.hidden==YES) {
		//color wheel is hidden, so don't handle  this as a color wheel event.
		[[self nextResponder] touchesEnded:touches withEvent:event];
		return;
	}
	
	UITouch* touch = [touches anyObject];
	CGPoint point = [touch locationInView:self]; //where image was tapped
    NSLog(@"%f is x, %f is y", point.x, point.y);
	
 
    // bottom right
    [self compareCenterColorWithColorAtOriginPoint:CGPointMake(222,291)];
    // bottom center
   // [self compareCenterColorWithColorAtOriginPoint:CGPointMake(143, 288)];
    // bottom left
   // [self compareCenterColorWithColorAtOriginPoint:CGPointMake(66, 289)];
    // center right
    [self compareCenterColorWithColorAtOriginPoint:CGPointMake(219, 215)];
	
	[pickedColorDelegate pickedColor:(UIColor*)self.lastColor];
    [pickedColorDelegate centerColor:(UIColor*)self.centerColor];
  //  [pickedColorDelegate topLeftColor:(UIColor*)self.topLeftColor];
}
-(UIColor *)getCenterColor {
    UIColor* color = nil;
	CGImageRef inImage = self.image.CGImage;
    CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
    if (cgctx == NULL) { return nil; /* error */ }
	
    size_t w = CGImageGetWidth(inImage);
	size_t h = CGImageGetHeight(inImage);
	CGRect rect = {{0,0},{w,h}};
 
    CGContextDrawImage(cgctx, rect, inImage);
    unsigned char* data = CGBitmapContextGetData (cgctx);
    int averageRed;
    int averageGreen;
    int averageBlue;
    int averageAlpha;
    
    if (data != NULL) {

        CGPoint point = CGPointMake(143, 211);
        NSMutableArray *redArray = [[NSMutableArray alloc] init];
        NSMutableArray *greenArray = [[NSMutableArray alloc] init];
        NSMutableArray *blueArray = [[NSMutableArray alloc] init];
        NSMutableArray *alphaArray = [[NSMutableArray alloc] init];
        
        
        //Take 30 samples of the RGB in this square
        for(int i =0; i < 30; i++) {
            int offset = 8*((w*round(point.y+i))+round(point.x+i));

            
            NSNumber *redNumber = [NSNumber numberWithInt:data[offset+1]];
            [redArray addObject:redNumber];
            NSNumber *greenNumber = [NSNumber numberWithInt:data[offset + 2]];
            [greenArray addObject:greenNumber];
            NSNumber *blueNumber = [NSNumber numberWithInt:data[offset + 3]];
            [blueArray addObject:blueNumber];
            NSNumber *alphaNumber = [NSNumber numberWithInt:data[offset]];
            [alphaArray addObject:alphaNumber];
            
            
         }
		int totalRed =0;
        int totalGreen=0;
        int totalBlue=0;
        int totalAlpha=0;
       
        for (int i = 0; i < 30; i++) {
           
            NSNumber *redTemp = [redArray objectAtIndex:i];
            totalRed += [redTemp integerValue];
            averageRed = totalRed/30;
            
      
            NSNumber *greenTemp = [greenArray objectAtIndex:i];
            totalGreen += [greenTemp integerValue];
            averageGreen = totalGreen/30;
            
         
            NSNumber *blueTemp = [blueArray objectAtIndex:i];
            totalBlue += [blueTemp integerValue];
            averageBlue = totalBlue/30;
            
        
            NSNumber *alphaTemp = [alphaArray objectAtIndex:i];
            totalAlpha += [alphaTemp integerValue];
            averageAlpha = totalAlpha/30;
        
            
            
        }
        
	} else {
        return nil;
    }
    color = [UIColor colorWithRed:(averageRed/255.0f) green:(averageGreen/255.0f) blue:(averageBlue/255.0f) alpha:(averageAlpha/255.0f)];
    return color;
}



-(UIColor *)determineColorWithOriginPoint:(CGPoint)point {
    UIColor* color = nil;
	CGImageRef inImage = self.image.CGImage;
    CGContextRef cgctx = [self createARGBBitmapContextFromImage:inImage];
    if (cgctx == NULL) { return nil; /* error */ }
	
    size_t w = CGImageGetWidth(inImage);
	size_t h = CGImageGetHeight(inImage);
	CGRect rect = {{0,0},{w,h}};
    
    CGContextDrawImage(cgctx, rect, inImage);
    unsigned char* data = CGBitmapContextGetData (cgctx);
    int averageRed;
    int averageGreen;
    int averageBlue;
    int averageAlpha;
    
    if (data != NULL) {

        NSMutableArray *redArray = [[NSMutableArray alloc] init];
        NSMutableArray *greenArray = [[NSMutableArray alloc] init];
        NSMutableArray *blueArray = [[NSMutableArray alloc] init];
        NSMutableArray *alphaArray = [[NSMutableArray alloc] init];
        
        
        //Take 30 samples of the RGB in this square
        for(int i =0; i < 30; i++) {
            int offset = 8*((w*round(point.y+i))+round(point.x+i));
            
            
            NSNumber *redNumber = [NSNumber numberWithInt:data[offset+1]];
            [redArray addObject:redNumber];
            NSNumber *greenNumber = [NSNumber numberWithInt:data[offset + 2]];
            [greenArray addObject:greenNumber];
            NSNumber *blueNumber = [NSNumber numberWithInt:data[offset + 3]];
            [blueArray addObject:blueNumber];
            NSNumber *alphaNumber = [NSNumber numberWithInt:data[offset]];
            [alphaArray addObject:alphaNumber];
            
            
        }
        int totalRed=0;
        int totalGreen=0;
        int totalBlue=0;
        int totalAlpha=0;
        
        for (int i = 0; i < 30; i++) {
           
            NSNumber *redTemp = [redArray objectAtIndex:i];
            totalRed += [redTemp integerValue];
            averageRed = totalRed/30;
            
            
            NSNumber *greenTemp = [greenArray objectAtIndex:i];
            totalGreen += [greenTemp integerValue];
            averageGreen = totalGreen/30;
            
     
            NSNumber *blueTemp = [blueArray objectAtIndex:i];
            totalBlue += [blueTemp integerValue];
            averageBlue = totalBlue/30;
            
      
            NSNumber *alphaTemp = [alphaArray objectAtIndex:i];
            totalAlpha += [alphaTemp integerValue];
            averageAlpha = totalAlpha/30;
            
            
            
        }
        
	} else {
        return nil;
    }
   
    color = [UIColor colorWithRed:(averageRed/255.0f) green:(averageGreen/255.0f) blue:(averageBlue/255.0f) alpha:(averageAlpha/255.0f)];
    return color;
}

-(BOOL)compareCenterColorWithColorAtOriginPoint:(CGPoint)point {
    UIColor *centerColor = [self getCenterColor];
    UIColor *testColor = [self determineColorWithOriginPoint:point];
    
    CGFloat cred = 0.0, cgreen = 0.0, cblue = 0.0, calpha = 0.0;
    [centerColor getRed:&cred green:&cgreen blue:&cblue alpha:&calpha];
    cred = cred * 255;
    cgreen = cgreen *255;
    cblue = cblue *255;
    
    NSLog(@"%f %f %f are my center values", cred, cgreen, cblue);

    
    CGFloat tred = 0.0, tgreen = 0.0, tblue = 0.0, talpha = 0.0;
    
    [testColor getRed:&tred green:&tgreen blue:&tblue alpha:&talpha];
    tred = tred * 255;
    tgreen = tgreen *255;
    tblue = tblue *255;
    NSLog(@"%f %f %f are my test values", tred, tgreen, tblue);
    
    
    BOOL redGood = NO;
    BOOL greenGood = NO;
    BOOL blueGood = NO;
    
    if (tred < cred +20 && tred > cred -20) {
       
        redGood = YES;
    }
    if (tgreen < cgreen +20 && tgreen > cgreen -20) {
       
        greenGood = YES;
    }
    
    if (tblue < cblue + 20 && tblue > cblue - 20) {
      
        blueGood = YES;
    }
    if (redGood && greenGood && blueGood) {
        NSLog(@"This should be the same color as center");
        return YES;
    } else {
        NSLog(@"Not the same color");
        return NO;
        
    }
    
}


- (CGContextRef) createARGBBitmapContextFromImage:(CGImageRef) inImage {
	
	CGContextRef    context = NULL;
	CGColorSpaceRef colorSpace;
	void *          bitmapData;
	int             bitmapByteCount;
	int             bitmapBytesPerRow;
	
	// Get image width, height. We'll use the entire image.
	size_t pixelsWide = CGImageGetWidth(inImage);
	size_t pixelsHigh = CGImageGetHeight(inImage);
	
	// Declare the number of bytes per row. Each pixel in the bitmap in this
	// example is represented by 4 bytes; 8 bits each of red, green, blue, and
	// alpha.
	bitmapBytesPerRow   = (pixelsWide * 4);
	bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
	
	// Use the generic RGB color space.
	colorSpace = CGColorSpaceCreateDeviceRGB();

	if (colorSpace == NULL)
	{
		fprintf(stderr, "Error allocating color space\n");
		return NULL;
	}
	
	// Allocate memory for image data. This is the destination in memory
	// where any drawing to the bitmap context will be rendered.
	bitmapData = malloc( bitmapByteCount );
	if (bitmapData == NULL) 
	{
		fprintf (stderr, "Memory not allocated!");
		CGColorSpaceRelease( colorSpace );
		return NULL;
	}
	
	// Create the bitmap context. We want pre-multiplied ARGB, 8-bits 
	// per component. Regardless of what the source image format is 
	// (CMYK, Grayscale, and so on) it will be converted over to the format
	// specified here by CGBitmapContextCreate.
	context = CGBitmapContextCreate (bitmapData,
									 pixelsWide,
									 pixelsHigh,
									 8,      // bits per component
									 bitmapBytesPerRow,
									 colorSpace,
									 kCGImageAlphaPremultipliedFirst);
	if (context == NULL)
	{
		free (bitmapData);
		fprintf (stderr, "Context not created!");
	}
	
	// Make sure and release colorspace before returning
	CGColorSpaceRelease( colorSpace );
	
	return context;
}



@end
