//
//  SelectPiecesViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/21/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "SelectPiecesViewController.h"
#import "StorageManager.h"
#import "OLLDetailViewController.h"
#import "OLL.h"

@interface SelectPiecesViewController ()
@property (weak, nonatomic) IBOutlet UIView *aView;
@property (weak, nonatomic) IBOutlet UIView *bView;
@property (weak, nonatomic) IBOutlet UIView *cView;
@property (weak, nonatomic) IBOutlet UIView *dView;
@property (weak, nonatomic) IBOutlet UIView *eView;
@property (weak, nonatomic) IBOutlet UIView *fView;
@property (weak, nonatomic) IBOutlet UIView *gView;
@property (weak, nonatomic) IBOutlet UIView *hView;
@property (weak, nonatomic) IBOutlet UIView *iView;

@property (weak, nonatomic) IBOutlet UIButton *dButton;
@property (weak, nonatomic) IBOutlet UIButton *eButton;
@property (weak, nonatomic) IBOutlet UIButton *fButton;
@property (weak, nonatomic) IBOutlet UIButton *gButton;
@property (weak, nonatomic) IBOutlet UIButton *hButton;
@property (weak, nonatomic) IBOutlet UIButton *iButton;
@property (weak, nonatomic) IBOutlet UIButton *aButton;
@property (weak, nonatomic) IBOutlet UIButton *bButton;
@property (weak, nonatomic) IBOutlet UIButton *cButton;


@property (weak, nonatomic) IBOutlet UILabel *currentFaceLabel;
@property (nonatomic) UIColor *botColor;
@property (nonatomic) UIColor *frontColor;
@property (nonatomic) UIColor *rightColor;
@property (nonatomic) UIColor *backColor;
@property (nonatomic) UIColor *leftColor;

@property (weak, nonatomic) NSString *currentFace;
@property (nonatomic, strong) NSMutableArray *topArray;
@property (nonatomic, strong) NSMutableArray *frontArray;
@property (nonatomic, strong) NSMutableArray *rightArray;
@property (nonatomic, strong) NSMutableArray *backArray;
@property (nonatomic, strong) NSMutableArray *leftArray;

@property (nonatomic) int face;
@property (nonatomic) BOOL aTrue;
@property (nonatomic) BOOL bTrue;
@property (nonatomic) BOOL cTrue;

@property (nonatomic) BOOL dTrue;
@property (nonatomic) BOOL eTrue;
@property (nonatomic) BOOL fTrue;
@property (nonatomic) BOOL gTrue;
@property (nonatomic) BOOL hTrue;
@property (nonatomic) BOOL iTrue;


- (IBAction)aPressed:(id)sender;
- (IBAction)bPressed:(id)sender;
- (IBAction)cPressed:(id)sender;
- (IBAction)dPressed:(id)sender;
- (IBAction)ePressed:(id)sender;
- (IBAction)fPressed:(id)sender;
- (IBAction)gPressed:(id)sender;
- (IBAction)hPressed:(id)sender;
- (IBAction)iPressed:(id)sender;

- (IBAction)nextPressed:(id)sender;

@property (nonatomic) OLL *selectedOLL;







@end

@implementation SelectPiecesViewController

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
    //Get the colors from User defaults/settings menu
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    self.botColor = [self colorFromString:[defaults objectForKey:@"Bottom"]];
    self.frontColor = [self colorFromString:[defaults objectForKey:@"Front"]];
    self.rightColor = [self colorFromString:[defaults objectForKey:@"Right"]];
    self.backColor = [self colorFromString:[defaults objectForKey:@"Back"]];
    self.leftColor = [self colorFromString:[defaults objectForKey:@"Left"]];
 
    _face = 0;
    self.topArray = [[NSMutableArray alloc] init];
    self.frontArray = [[NSMutableArray alloc] init];
    self.rightArray = [[NSMutableArray alloc] init];
    self.backArray = [[NSMutableArray alloc] init];
    self.leftArray = [[NSMutableArray alloc] init];
   
}

-(UIColor *)colorFromString:(NSString *)colorString {
    UIColor *color = nil;
    NSLog(@"%@ is colorString", colorString);
    if ([colorString isEqualToString:@"Yellow"]) {
        color = [UIColor yellowColor];
    } else if ([colorString isEqualToString:@"White"]) {
        color = [UIColor whiteColor];
    } else if ([colorString isEqualToString:@"Green"]) {
        color = [UIColor greenColor];
    } else if ([colorString isEqualToString:@"Orange"]) {
        color = [UIColor orangeColor];
    } else if ([colorString isEqualToString:@"Blue"]) {
        color = [UIColor blueColor];
    } else if ([colorString isEqualToString:@"Red"]) {
        color = [UIColor redColor];
    }
    
    return color;
    
}

-(void)viewWillAppear:(BOOL)animated {
    
  
    
    self.currentFaceLabel.text = self.currentFace;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)aPressed:(id)sender {
    if (!self.aTrue) {
    self.aView.backgroundColor = self.botColor;
    self.aTrue = YES;
    } else if (self.aTrue) {
        self.aView.backgroundColor = [UIColor darkGrayColor];
        self.aTrue = NO;
    }
    
    
}

- (IBAction)bPressed:(id)sender {
    if (!self.bTrue) {
        self.bView.backgroundColor = self.botColor;
        self.bTrue = YES;
    } else if (self.bTrue) {
        self.bView.backgroundColor = [UIColor darkGrayColor];
        self.bTrue = NO;
    }
}

- (IBAction)cPressed:(id)sender {
    if (!self.cTrue) {
        self.cView.backgroundColor = self.botColor;
        self.cTrue = YES;
    } else if (self.cTrue) {
        self.cView.backgroundColor = [UIColor darkGrayColor];
        self.cTrue = NO;
    }
}

- (IBAction)dPressed:(id)sender {
    if (!self.dTrue) {
        self.dView.backgroundColor = self.botColor;
        self.dTrue = YES;
    } else if (self.dTrue) {
        self.dView.backgroundColor = [UIColor darkGrayColor];
        self.dTrue = NO;
    }
}

- (IBAction)ePressed:(id)sender {
    if (!self.eTrue) {
        self.eView.backgroundColor = self.botColor;
        self.eTrue = YES;
    } else if (self.eTrue) {
        self.eView.backgroundColor = [UIColor darkGrayColor];
        self.eTrue = NO;
    }
}

- (IBAction)fPressed:(id)sender {
    if (!self.fTrue) {
        self.fView.backgroundColor = self.botColor;
        self.fTrue = YES;
    } else if (self.fTrue) {
        self.fView.backgroundColor = [UIColor darkGrayColor];
        self.fTrue = NO;
    }
}

- (IBAction)gPressed:(id)sender {
    if (!self.gTrue) {
        self.gView.backgroundColor = self.botColor;
        self.gTrue = YES;
    } else if (self.gTrue) {
        self.gView.backgroundColor = [UIColor darkGrayColor];
        self.gTrue = NO;
    }
}

- (IBAction)hPressed:(id)sender {
    if (!self.hTrue) {
        self.hView.backgroundColor = self.botColor;
        self.hTrue = YES;
    } else if (self.hTrue) {
        self.hView.backgroundColor = [UIColor darkGrayColor];
        self.hTrue = NO;
    }
}

- (IBAction)iPressed:(id)sender {
    if (!self.iTrue) {
        self.iView.backgroundColor = self.botColor;
        self.iTrue = YES;
    } else if (self.iTrue) {
        self.iView.backgroundColor = [UIColor darkGrayColor];
        self.iTrue = NO;
    }
}

- (IBAction)nextPressed:(id)sender {
    if (![self.currentFace isEqualToString: @"Left"]) {
        switch (_face) {
            case 0:
                [self.topArray insertObject:[NSNumber numberWithBool:self.aTrue] atIndex:0];
                [self.topArray insertObject:[NSNumber numberWithBool:self.bTrue] atIndex:1];
                [self.topArray insertObject:[NSNumber numberWithBool:self.cTrue] atIndex:2];
                [self.topArray insertObject:[NSNumber numberWithBool:self.dTrue] atIndex:3];
                [self.topArray insertObject:[NSNumber numberWithBool:self.eTrue] atIndex:4];
                [self.topArray insertObject:[NSNumber numberWithBool:self.fTrue] atIndex:5];
                [self.topArray insertObject:[NSNumber numberWithBool:self.gTrue] atIndex:6];
                [self.topArray insertObject:[NSNumber numberWithBool:self.hTrue] atIndex:7];
                [self.topArray insertObject:[NSNumber numberWithBool:self.iTrue] atIndex:8];
                break;
            case 1:
                [self.frontArray insertObject:[NSNumber numberWithBool:self.aTrue] atIndex:0];
                [self.frontArray insertObject:[NSNumber numberWithBool:self.bTrue] atIndex:1];
                [self.frontArray insertObject:[NSNumber numberWithBool:self.cTrue] atIndex:2];
                break;
            case 2:
                [self.rightArray insertObject:[NSNumber numberWithBool:self.aTrue] atIndex:0];
                [self.rightArray insertObject:[NSNumber numberWithBool:self.bTrue] atIndex:1];
                [self.rightArray insertObject:[NSNumber numberWithBool:self.cTrue] atIndex:2];
                break;
            case 3:
                [self.backArray insertObject:[NSNumber numberWithBool:self.aTrue] atIndex:0];
                [self.backArray insertObject:[NSNumber numberWithBool:self.bTrue] atIndex:1];
                [self.backArray insertObject:[NSNumber numberWithBool:self.cTrue] atIndex:2];
            default:
                break;
        }
        _face ++;
        [self resetView];
    } else if ([self.currentFace isEqualToString:@"Left"]) {
        [self.leftArray insertObject:[NSNumber numberWithBool:self.aTrue] atIndex:0];
        [self.leftArray insertObject:[NSNumber numberWithBool:self.bTrue] atIndex:1];
        [self.leftArray insertObject:[NSNumber numberWithBool:self.cTrue] atIndex:2];
        
        [self constructResultArray];
    }
}

-(void)resetView {
    
    self.aTrue = 0;
    self.bTrue = 0;
    self.cTrue = 0;
    self.aView.backgroundColor = [UIColor darkGrayColor];
    self.bView.backgroundColor = [UIColor darkGrayColor];
    self.cView.backgroundColor = [UIColor darkGrayColor];
    self.dButton.enabled = NO;
    self.eButton.enabled = NO;
    self.fButton.enabled = NO;
    self.gButton.enabled = NO;
    self.hButton.enabled = NO;
    self.iButton.enabled = NO;
    
    
    
    
    
    switch (_face) {
        case 0:
            //This is top face. Shouldn't be necessary until adding features to allow users to go back and change their selections
            break;
        case 1:
            //Take front face from settings, using green for now
            
            self.currentFace = @"Front";
            self.currentFaceLabel.text = @"Front Face";
            self.dView.backgroundColor = self.frontColor;
            self.eView.backgroundColor = self.frontColor;
            self.fView.backgroundColor = self.frontColor;
            self.gView.backgroundColor = self.frontColor;
            self.hView.backgroundColor = self.frontColor;
            self.iView.backgroundColor = self.frontColor;
            break;
        case 2:
            
            self.currentFace = @"Right";
            self.currentFaceLabel.text = @"Right Face";
            self.dView.backgroundColor = self.rightColor;
            self.eView.backgroundColor = self.rightColor;
            self.fView.backgroundColor = self.rightColor;
            self.gView.backgroundColor = self.rightColor;
            self.hView.backgroundColor = self.rightColor;
            self.iView.backgroundColor = self.rightColor;
            break;
        case 3:
            
            self.currentFace = @"Back";
            self.currentFaceLabel.text = @"Back Face";
            self.dView.backgroundColor = self.backColor;
            self.eView.backgroundColor = self.backColor;
            self.fView.backgroundColor = self.backColor;
            self.gView.backgroundColor = self.backColor;
            self.hView.backgroundColor = self.backColor;
            self.iView.backgroundColor = self.backColor;
            break;
        case 4:
            
            self.currentFace = @"Left";
            self.currentFaceLabel.text = @"Left Face";
            self.dView.backgroundColor = self.leftColor;
            self.eView.backgroundColor = self.leftColor;
            self.fView.backgroundColor = self.leftColor;
            self.gView.backgroundColor = self.leftColor;
            self.hView.backgroundColor = self.leftColor;
            self.iView.backgroundColor = self.leftColor;
            break;
        default:
            break;
    }
    
}
-(void)constructResultArray {
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    [resultArray insertObject:[NSNumber numberWithInt:0] atIndex:0];
    [resultArray insertObject:[self.backArray objectAtIndex:2] atIndex:1];
    [resultArray insertObject:[self.backArray objectAtIndex:1] atIndex:2];
    [resultArray insertObject:[self.backArray objectAtIndex:0] atIndex:3];
    [resultArray insertObject:[NSNumber numberWithInt:0] atIndex:4];
    
    [resultArray insertObject:[self.leftArray objectAtIndex:0] atIndex:5];
    [resultArray insertObject:[self.topArray objectAtIndex:0] atIndex:6];
    [resultArray insertObject:[self.topArray objectAtIndex:1] atIndex:7];
    [resultArray insertObject:[self.topArray objectAtIndex:2] atIndex:8];
    [resultArray insertObject:[self.rightArray objectAtIndex:2] atIndex:9];
    
    [resultArray insertObject:[self.leftArray objectAtIndex:1] atIndex:10];
    [resultArray insertObject:[self.topArray objectAtIndex:3] atIndex:11];
    [resultArray insertObject:[self.topArray objectAtIndex:4] atIndex:12];
    [resultArray insertObject:[self.topArray objectAtIndex:5] atIndex:13];
    [resultArray insertObject:[self.rightArray objectAtIndex:1] atIndex:14];
    
    [resultArray insertObject:[self.leftArray objectAtIndex:2] atIndex:15];
    [resultArray insertObject:[self.topArray objectAtIndex:6] atIndex:16];
    [resultArray insertObject:[self.topArray objectAtIndex:7] atIndex:17];
    [resultArray insertObject:[self.topArray objectAtIndex:8] atIndex:18];
    [resultArray insertObject:[self.rightArray objectAtIndex:0] atIndex:19];
    
    [resultArray insertObject:[NSNumber numberWithInt:0] atIndex:20];
    [resultArray insertObject:[self.frontArray objectAtIndex:0] atIndex:21];
    [resultArray insertObject:[self.frontArray objectAtIndex:1] atIndex:22];
    [resultArray insertObject:[self.frontArray objectAtIndex:2] atIndex:23];
    [resultArray insertObject:[NSNumber numberWithInt:0] atIndex:24];
    
    [self createResultStringWithArray:resultArray];
    //[self getOLLInformation:@"0001010100011100011001000"];
    
    
}

-(void)createResultStringWithArray:(NSArray *)resultArray{
    NSString *result = [NSString string];
    for (int i =0; i < [resultArray count]; i++) {
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@", [resultArray objectAtIndex:i]]];
    }
    
    [self getOLLInformation:result];
}

-(void)getOLLInformation:(NSString *)binaryString {
   //Based on the current configuration figure out which iteration of the OLL is required
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"binary" inManagedObjectContext:[[StorageManager sharedManager] managedObjectContext]];
     [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"binary == %@", binaryString];
    [fetchRequest setPredicate:predicate];
     NSError *error;
     NSArray *result = [[[StorageManager sharedManager]managedObjectContext] executeFetchRequest:fetchRequest error:&error];
     
    NSString *foundOLL = [result objectAtIndex:1];
    NSString *setUp = [result objectAtIndex:2];
    
    
    NSFetchRequest *fetchRequest2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity2 = [NSEntityDescription entityForName:@"OLL" inManagedObjectContext:[[StorageManager sharedManager] managedObjectContext]];
    [fetchRequest2 setEntity:entity2];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"key == %@", foundOLL];
    [fetchRequest2 setPredicate:predicate2];
    NSError *error2;
    NSArray *result2 = [[[StorageManager sharedManager] managedObjectContext] executeFetchRequest:fetchRequest2 error:&error2];
    
    self.selectedOLL = [result2 objectAtIndex:0];
   
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Before you move on" message:[NSString stringWithFormat:@"Complete this prior to moving on: %@", setUp] delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
    [alert show];
    
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        [segue.destinationViewController setDetailOLL:self.selectedOLL];
        
    }
    
}
@end
