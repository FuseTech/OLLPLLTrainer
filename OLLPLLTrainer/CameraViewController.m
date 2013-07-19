//
//  CameraViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "CameraViewController.h"
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

typedef enum {
    Top,
    Front,
    Right,
    Back,
    Left
}currentFace;

@interface CameraViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImage *topFace;
@property (nonatomic, strong) UIImage *frontFace;
@property (nonatomic, strong) UIImage *rightFace;
@property (nonatomic, strong) UIImage *backFace;
@property (nonatomic, strong) UIImage *leftFace;

@property (nonatomic) currentFace currentFace;



- (IBAction)topButtonPressed:(id)sender;
- (IBAction)frontButtonPressed:(id)sender;
- (IBAction)rightButtonPressed:(id)sender;
- (IBAction)backButtonPressed:(id)sender;
- (IBAction)leftButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (weak, nonatomic) IBOutlet UIButton *frontButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (nonatomic, strong) UIColor *centerColor;

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    //Proceed once all images have been taken
    if (self.topFace && self.frontFace && self.rightFace && self.backFace && self.leftFace) {
       self.centerColor = [self getCenterColor];
        [self analyzeLayer];
    }
}

-(void)analyzeLayer {
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    //Compare each piece with the center color, and add it to the result array in the specified order for analysis
    NSNumber *start = [NSNumber numberWithInt:0];
    [resultArray insertObject:start atIndex:0];
    NSNumber *B3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.backFace]];
    [resultArray addObject:B3];
    NSNumber *B2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.backFace]];
    [resultArray addObject:B2];
    NSNumber *B1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.backFace]];
    [resultArray addObject:B1];
    NSNumber *blank = [NSNumber numberWithInt:0];
    [resultArray addObject:blank];
    
    NSNumber *L1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.leftFace]];
    [resultArray addObject:L1];
    NSNumber *T1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.topFace]];
    [resultArray addObject:T1];
    NSNumber *T2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.topFace]];
    [resultArray addObject:T2];
    NSNumber *T3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.topFace]];
    [resultArray addObject:T3];
    NSNumber *R3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.rightFace]];
    [resultArray addObject:R3];
    
    NSNumber *L2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.leftFace]];
    [resultArray addObject:L2];
    NSNumber *T4 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:MidLeft onFace:self.topFace]];
    [resultArray addObject:T4];
    NSNumber *T5 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:MidCenter onFace:self.topFace]];
    [resultArray addObject:T5];
    NSNumber *T6 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:MidRight onFace:self.topFace]];
    [resultArray addObject:T6];
    NSNumber *R2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.rightFace]];
    [resultArray addObject:R2];
    
    NSNumber *L3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.leftFace]];
    [resultArray addObject:L3];
    NSNumber *T7 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:BottomLeft onFace:self.topFace]];
    [resultArray addObject:T7];
    NSNumber *T8 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:BottomCenter onFace:self.topFace]];
    [resultArray addObject:T8];
    NSNumber *T9 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:BottomRight onFace:self.topFace]];
    [resultArray addObject:T9];
    NSNumber *R1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.rightFace]];
    [resultArray addObject:R1];
    
    NSNumber *blank2 = [NSNumber numberWithInt:0];
    [resultArray addObject:blank2];
    NSNumber *F1 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopLeft onFace:self.frontFace]];
    [resultArray addObject:F1];
    NSNumber *F2 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopCenter onFace:self.frontFace]];
    [resultArray addObject:F2];
    NSNumber *F3 = [NSNumber numberWithInt:[self checkColorWithOriginPoint:TopRight onFace:self.frontFace]];
    [resultArray addObject:F3];
    NSNumber *end = [NSNumber numberWithInt:0];
    [resultArray addObject:end];
    
    //Now that we have a True/False values for pieces that match the center color, we can compare it to the database
    [self findMatch];
}

-(void)findMatch {
    
    
}

#pragma mark IB Actions

- (IBAction)topButtonPressed:(id)sender {
     self.currentFace = Top;
    
    UIImagePickerController *picturePicker = [[UIImagePickerController alloc] init];
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [picturePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    picturePicker.cameraOverlayView = overlay;
    [picturePicker setDelegate:self];
    [self presentViewController:picturePicker animated:YES completion:NULL];
}

- (IBAction)frontButtonPressed:(id)sender {
    self.currentFace = Front;
    
    UIImagePickerController *picturePicker = [[UIImagePickerController alloc] init];
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [picturePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    picturePicker.cameraOverlayView = overlay;
    [picturePicker setDelegate:self];
    [self presentViewController:picturePicker animated:YES completion:NULL];
}

- (IBAction)rightButtonPressed:(id)sender {
    self.currentFace = Right;
    
    UIImagePickerController *picturePicker = [[UIImagePickerController alloc] init];
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [picturePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    picturePicker.cameraOverlayView = overlay;
    [picturePicker setDelegate:self];
    [self presentViewController:picturePicker animated:YES completion:NULL];
}

- (IBAction)backButtonPressed:(id)sender {
    self.currentFace = Back;
    
    UIImagePickerController *picturePicker = [[UIImagePickerController alloc] init];
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [picturePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    picturePicker.cameraOverlayView = overlay;
    [picturePicker setDelegate:self];
    [self presentViewController:picturePicker animated:YES completion:NULL];
}

- (IBAction)leftButtonPressed:(id)sender {
    
    self.currentFace = Left;
    
    UIImagePickerController *picturePicker = [[UIImagePickerController alloc] init];
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [picturePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    picturePicker.cameraOverlayView = overlay;
    [picturePicker setDelegate:self];
    [self presentViewController:picturePicker animated:YES completion:NULL];
}

#pragma mark ImagePicker Methods
- (void) imagePickerController: (UIImagePickerController *)picker
 didFinishPickingMediaWithInfo: (NSDictionary *)info {
    
    UIImage *selectedImage = (UIImage *) [info objectForKey:
                                          UIImagePickerControllerOriginalImage];
    UIImage *resizedImage = [selectedImage resizedImageToSize:CGSizeMake(320, 480)];
    NSLog(@"%f is width and %f is height for orig", selectedImage.size.width, selectedImage.size.height);
    NSLog(@"%f is w and %f is h for resized", resizedImage.size.width, resizedImage.size.height);
    
    
    switch (self.currentFace) {
        case Top:
            self.topFace = resizedImage;
            self.topButton.backgroundColor = [UIColor grayColor];
            break;
        case Front:
            self.frontFace = resizedImage;
            self.frontButton.backgroundColor = [UIColor grayColor];
            break;
        case Right:
            self.rightFace = resizedImage;
            self.rightButton.backgroundColor = [UIColor grayColor];
            break;
        case Back:
            self.backFace = resizedImage;
            self.backButton.backgroundColor = [UIColor grayColor];
            break;
        case Left:
            self.leftFace = resizedImage;
            self.leftButton.backgroundColor = [UIColor grayColor];
            break;
            
        default:
            break;
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void) imagePickerControllerDidCancel: (UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark Color Detection Methods
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



@end
