//
//  ViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/16/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "ViewController.h"
#import "OverlayView.h"
#import "UIImage+Resize.h"

#define TopLeft CGPointMake(80,150)
#define TopCenter CGPointMake(150,150)
#define TopRight CGPointMake(230,150)
#define MidLeft CGPointMake(80,220)
#define MidCenter CGPointMake (150,220)
#define MidRight CGPointMake (230,220)
#define BottomLeft CGPointMake (80,300)
#define BottomCenter CGPointMake (150,300)
#define BottomRight CGPointMake (230,300)
#define numOfSamples 10


@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


//Use
@property (nonatomic, strong) UIImage *topFace;
@property (nonatomic, strong) UIImage *frontFace;
@property (nonatomic, strong) UIImage *rightFace;
@property (nonatomic, strong) UIImage *backFace;
@property (nonatomic, strong) UIImage *leftFace;

@property (nonatomic, strong) UIColor *centerColor;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
   // self.topFace = [UIImage imageNamed:@"fishFace.png"];
  //  UIImage *selectedImage = [UIImage imageNamed:@"yellowface.jpeg"];
   // self.cubeImage.image = selectedImage;
  //  self.topFace = selectedImage;

    
   // UIImage *resizedImage = [selectedImage resizedImageToSize:CGSizeMake(320, 480)];
   // self.cubeImage.image = resizedImage;
   // self.topFace = resizedImage;
    
   // self.centerColor = [self getCenterColor];
    /*
   int test =  [self checkColorWithOriginPoint:TopLeft onFace:self.topFace];
    int test2 = [self checkColorWithOriginPoint:TopCenter onFace:self.topFace];
    NSLog(@"result of test is %d", test);
    NSLog(@"result of test 2 id %d", test2);
     */
   // [self analyzeFace];
}

-(void)viewDidAppear:(BOOL)animated {
    if (self.topFace) {
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)selectImagePressed:(id)sender {
    
    
    UIImagePickerController *picturePicker = [[UIImagePickerController alloc] init];
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [picturePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    picturePicker.cameraOverlayView = overlay;
    [picturePicker setDelegate:self];
    
    [self presentViewController:picturePicker animated:YES completion:NULL];
    
    
    //Need to take a picture with the overlay in place, and then reset the CGPoints for where to locate the pieces. Consider how this will vary on iPhone 5
    /*
    UIImage *bigImage = self.topFace;
    UIImage *resizedImage = [bigImage resizedImageToSize:CGSizeMake(320, 480)];
    self.cubeImage.image = resizedImage;
     */
    
    
}





-(NSString *)generateSequence:(NSArray *)array {
    NSString *result = [NSString string];
    for (int i =0; i < [array count]; i++) {
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@", [array objectAtIndex:i]]];
    }
    
    return result;
}

-(void)getOLLInformation:(NSString *)OLLKey {
    /*
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"OLL" inManagedObjectContext:[[StorageManager sharedManager] managedObjectContext]];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *result = [[[StorageManager sharedManager]managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    
    self.selectedOLL = [result objectAtIndex:0];
     */
    
}



-(void)compareString:(NSString *)string {
    NSDictionary *OLLDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"0100000101011100110000010", @"OLL1-1", @"0000001101011101010000010", @"OLL1-2", @"0100000110011101010000010", @"OLL1-3", @"0100000101011101011000000", @"OLL1-4", @"0001010100011100110100000", @"OLL2-1", @"0001001100011100010101000", @"OLL2-2", @"0000010110011100010101000", @"OLL2-3", @"0001010100011100011001000", @"OLL2-4",@"0101000100011100111000000", @"OLL3-1", @"0000001101011100110100000", @"OLL3-2", @"0000001110011100010001010", @"OLL3-3", @"0000010110011101011000000", @"OLL3-4", @"0000010101011100111000000", @"OLL4-1", @"0001001100011100110000010", @"OLL4-2", @"0000001110011101010100000", @"OLL4-3", @"0100000110011100011001000", @"OLL4-4",@"0001010100011101010000010", @"OLL5-1", @"0101000100011101010100000", @"OLL5-2", @"0100000101011100010101000", @"OLL5-3", @"0000010101011100010001010", @"OLL5-4", @"0000010101011101010100000", @"OLL6-1", @"0101000100011100010001010", @"OLL6-2", @"0000010110011100110000010", @"OLL7-1", @"0001001100011101011000000", @"OLL7-2", @"0100000110011100110100000", @"OLL7-3", @"0000001101011100011001000", @"OLL7-4", nil];
    
    [OLLDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isEqualToString:string]) {
            //Retrieve OLL information based on Key
            //Image, Algorithm, stats, notes
            [self getOLLInformation:key];
            *stop =YES;
        }
        
    }];
    
    
}


-(void)analyzeFace {
    NSMutableArray *aTestArray = [[NSMutableArray alloc] init];
    //Test each piece and add to the array in the proper order
    /*
    NSNumber *start = [NSNumber numberWithInt:0];
    [aTestArray insertObject:start atIndex:0];
    NSNumber *B3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.backFace]];
    [aTestArray addObject:B3];
    NSNumber *B2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.backFace]];
    [aTestArray addObject:B2];
    NSNumber *B1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.backFace]];
    [aTestArray addObject:B1];
    NSNumber *blank = [NSNumber numberWithInt:0];
    [aTestArray addObject:blank];
    NSNumber *L1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.leftFace]];
    [aTestArray addObject:L1];
     */
    NSNumber *T1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.topFace]];
    [aTestArray addObject:T1];
    NSNumber *T2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.topFace]];
    [aTestArray addObject:T2];
    NSNumber *T3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.topFace]];
    [aTestArray addObject:T3];
    /*
    NSNumber *R3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.rightFace]];
    [aTestArray addObject:R3];
    NSNumber *L2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.leftFace]];
    [aTestArray addObject:L2];
     */
    NSNumber *T4 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:MidLeft onFace:self.topFace]];
    [aTestArray addObject:T4];
    NSNumber *T5 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:MidCenter onFace:self.topFace]];
    [aTestArray addObject:T5];
    NSNumber *T6 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:MidRight onFace:self.topFace]];
    [aTestArray addObject:T6];
    /*
    NSNumber *R2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.rightFace]];
    [aTestArray addObject:R2];
    NSNumber *L3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.leftFace]];
    [aTestArray addObject:L3];
    */
    NSNumber *T7 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:BottomLeft onFace:self.topFace]];
    [aTestArray addObject:T7];
    NSNumber *T8 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:BottomCenter onFace:self.topFace]];
    [aTestArray addObject:T8];
    NSNumber *T9 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:BottomRight onFace:self.topFace]];
    [aTestArray addObject:T9];
    /*
    NSNumber *R1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.rightFace]];
    [aTestArray addObject:R1];
    NSNumber *blank2 = [NSNumber numberWithInt:0];
    [aTestArray addObject:blank2];
    NSNumber *F1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.frontFace]];
    [aTestArray addObject:F1];
    NSNumber *F2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.frontFace]];
    [aTestArray addObject:F2];
    NSNumber *F3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.frontFace]];
    [aTestArray addObject:F3];
    NSNumber *end = [NSNumber numberWithInt:0];
    [aTestArray addObject:end];
     */
    NSLog(@"%@", aTestArray);
    
   // [self compareString:[self generateSequence:aTestArray]];
}



#pragma mark ImagePicker Methods
- (void) imagePickerController: (UIImagePickerController *)picker
 didFinishPickingMediaWithInfo: (NSDictionary *)info {
    
    UIImage *selectedImage = (UIImage *) [info objectForKey:
                                          UIImagePickerControllerOriginalImage];
    UIImage *resized = [selectedImage resizedImageToSize:CGSizeMake(960,640)];
   // UIImage *resizedImage =  [[self class] imageWithImage:selectedImage scaledToSize:CGSizeMake(320,480)];
    NSLog(@"%f is width and %f is height for orig", selectedImage.size.width, selectedImage.size.height);
   // NSLog(@"%f is w and %f is h for resized", resizedImage.size.width, resizedImage.size.height);
    self.topFace = resized;
    self.cubeImage.image = self.topFace;
    
   // self.topFace = resizedImage;
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    //  [self analyzeFace];
    
}


- (void) imagePickerControllerDidCancel: (UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark Piece Analysis Methods
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
									 kCGBitmapAlphaInfoMask & kCGImageAlphaPremultipliedFirst);
	if (context == NULL)
	{
		free (bitmapData);
		fprintf (stderr, "Context not created!");
	}
	
	// Make sure and release colorspace before returning
	CGColorSpaceRelease( colorSpace );
	return context;
}

-(UIColor *)getCenterColor {
    UIColor* color = nil;
	CGImageRef inImage = self.topFace.CGImage;
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
    
    
    
    CGPoint point = MidCenter;
    NSMutableArray *redArray = [[NSMutableArray alloc] init];
    NSMutableArray *greenArray = [[NSMutableArray alloc] init];
    NSMutableArray *blueArray = [[NSMutableArray alloc] init];
    NSMutableArray *alphaArray = [[NSMutableArray alloc] init];
    
    
    //Take 30 samples of the RGB in this square
    for(int i =0; i < numOfSamples; i++) {
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
    CGContextRelease(cgctx);
    // Free image data memory for the context
    if (data) { free(data);
    }
    
    int totalRed =0;
    int totalGreen=0;
    int totalBlue=0;
    int totalAlpha=0;
    
    for (int i = 0; i < numOfSamples; i++) {
        
        NSNumber *redTemp = [redArray objectAtIndex:i];
        totalRed += [redTemp integerValue];
        averageRed = totalRed/numOfSamples;
        
        
        NSNumber *greenTemp = [greenArray objectAtIndex:i];
        totalGreen += [greenTemp integerValue];
        averageGreen = totalGreen/numOfSamples;
        
        
        NSNumber *blueTemp = [blueArray objectAtIndex:i];
        totalBlue += [blueTemp integerValue];
        averageBlue = totalBlue/numOfSamples;
        
        
        NSNumber *alphaTemp = [alphaArray objectAtIndex:i];
        totalAlpha += [alphaTemp integerValue];
        averageAlpha = totalAlpha/numOfSamples;
        
        
        
    }
    
    color = [UIColor colorWithRed:(averageRed/255.0f) green:(averageGreen/255.0f) blue:(averageBlue/255.0f) alpha:(averageAlpha/255.0f)];
    NSLog(@" Center is %d %d %d", averageRed, averageGreen, averageBlue);
    return color;
}


-(UIColor *)determineColorWithOriginPoint:(CGPoint)point onFace:(UIImage *)face {
    UIColor* color = nil;
	CGImageRef inImage = face.CGImage;
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
    CGContextRelease(cgctx);
    // Free image data memory for the context
    if (data) {
        free(data);
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
    
	
    
    color = [UIColor colorWithRed:(averageRed/255.0f) green:(averageGreen/255.0f) blue:(averageBlue/255.0f) alpha:(averageAlpha/255.0f)];
    return color;
}



-(BOOL)checkColorWithOriginPoint:(CGPoint)point onFace:(UIImage *)face {
    UIColor *testColor = [self determineColorWithOriginPoint:point onFace:face];
    
    CGFloat cred = 0.0, cgreen = 0.0, cblue = 0.0, calpha = 0.0;
    [self.centerColor getRed:&cred green:&cgreen blue:&cblue alpha:&calpha];
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
    
    if (tred < cred +25 && tred > cred -25) {
        
        redGood = YES;
    }
    if (tgreen < cgreen +25 && tgreen > cgreen -25) {
        
        greenGood = YES;
    }
    
    if (tblue < cblue + 25 && tblue > cblue - 25) {
        
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

- (void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {

	
	UITouch* touch = [touches anyObject];
	CGPoint point = [touch locationInView:self.view]; //where image was tapped
    NSLog(@" %f, %f", point.x, point.y);
//	self.lastColor = [self getPixelColorAtLocation:point];
//	NSLog(@"color %@",lastColor);
//	[pickedColorDelegate pickedColor:(UIColor*)self.lastColor];
}

@end
