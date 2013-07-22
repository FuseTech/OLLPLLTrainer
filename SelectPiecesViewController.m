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
@property (nonatomic) UIColor *faceColor;

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
    //Set this based on settings initially, for now, start with yellow
    self.faceColor = [UIColor yellowColor];
    _face = 0;
    self.topArray = [[NSMutableArray alloc] init];
    self.frontArray = [[NSMutableArray alloc] init];
    self.rightArray = [[NSMutableArray alloc] init];
    self.backArray = [[NSMutableArray alloc] init];
    self.leftArray = [[NSMutableArray alloc] init];
   
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
    self.aView.backgroundColor = self.faceColor;
    self.aTrue = YES;
    } else if (self.aTrue) {
        self.aView.backgroundColor = [UIColor whiteColor];
        self.aTrue = NO;
    }
    
    
}

- (IBAction)bPressed:(id)sender {
    if (!self.bTrue) {
        self.bView.backgroundColor = self.faceColor;
        self.bTrue = YES;
    } else if (self.bTrue) {
        self.bView.backgroundColor = [UIColor whiteColor];
        self.bTrue = NO;
    }
}

- (IBAction)cPressed:(id)sender {
    if (!self.cTrue) {
        self.cView.backgroundColor = self.faceColor;
        self.cTrue = YES;
    } else if (self.cTrue) {
        self.cView.backgroundColor = [UIColor whiteColor];
        self.cTrue = NO;
    }
}

- (IBAction)dPressed:(id)sender {
    if (!self.dTrue) {
        self.dView.backgroundColor = self.faceColor;
        self.dTrue = YES;
    } else if (self.dTrue) {
        self.dView.backgroundColor = [UIColor whiteColor];
        self.dTrue = NO;
    }
}

- (IBAction)ePressed:(id)sender {
    if (!self.eTrue) {
        self.eView.backgroundColor = self.faceColor;
        self.eTrue = YES;
    } else if (self.eTrue) {
        self.eView.backgroundColor = [UIColor whiteColor];
        self.eTrue = NO;
    }
}

- (IBAction)fPressed:(id)sender {
    if (!self.fTrue) {
        self.fView.backgroundColor = self.faceColor;
        self.fTrue = YES;
    } else if (self.fTrue) {
        self.fView.backgroundColor = [UIColor whiteColor];
        self.fTrue = NO;
    }
}

- (IBAction)gPressed:(id)sender {
    if (!self.gTrue) {
        self.gView.backgroundColor = self.faceColor;
        self.gTrue = YES;
    } else if (self.gTrue) {
        self.gView.backgroundColor = [UIColor whiteColor];
        self.gTrue = NO;
    }
}

- (IBAction)hPressed:(id)sender {
    if (!self.hTrue) {
        self.hView.backgroundColor = self.faceColor;
        self.hTrue = YES;
    } else if (self.hTrue) {
        self.hView.backgroundColor = [UIColor whiteColor];
        self.hTrue = NO;
    }
}

- (IBAction)iPressed:(id)sender {
    if (!self.iTrue) {
        self.iView.backgroundColor = self.faceColor;
        self.iTrue = YES;
    } else if (self.iTrue) {
        self.iView.backgroundColor = [UIColor whiteColor];
        self.iTrue = NO;
    }
}

- (IBAction)nextPressed:(id)sender {
    if (![self.currentFace isEqualToString: @"Left"]) {
        switch (_face) {
            case 0:
                [self.topArray insertObject:[NSNumber numberWithBool:self.iTrue] atIndex:0];
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
    self.aView.backgroundColor = [UIColor whiteColor];
    self.bView.backgroundColor = [UIColor whiteColor];
    self.cView.backgroundColor = [UIColor whiteColor];
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
            self.dView.backgroundColor = [UIColor greenColor];
            self.eView.backgroundColor = [UIColor greenColor];
            self.fView.backgroundColor = [UIColor greenColor];
            self.gView.backgroundColor = [UIColor greenColor];
            self.hView.backgroundColor = [UIColor greenColor];
            self.iView.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            
            self.currentFace = @"Right";
            self.currentFaceLabel.text = @"Right Face";
            self.dView.backgroundColor = [UIColor orangeColor];
            self.eView.backgroundColor = [UIColor orangeColor];
            self.fView.backgroundColor = [UIColor orangeColor];
            self.gView.backgroundColor = [UIColor orangeColor];
            self.hView.backgroundColor = [UIColor orangeColor];
            self.iView.backgroundColor = [UIColor orangeColor];
            break;
        case 3:
            
            self.currentFace = @"Back";
            self.currentFaceLabel.text = @"Back Face";
            self.dView.backgroundColor = [UIColor blueColor];
            self.eView.backgroundColor = [UIColor blueColor];
            self.fView.backgroundColor = [UIColor blueColor];
            self.gView.backgroundColor = [UIColor blueColor];
            self.hView.backgroundColor = [UIColor blueColor];
            self.iView.backgroundColor = [UIColor blueColor];
            break;
        case 4:
            
            self.currentFace = @"Left";
            self.currentFaceLabel.text = @"Left Face";
            self.dView.backgroundColor = [UIColor redColor];
            self.eView.backgroundColor = [UIColor redColor];
            self.fView.backgroundColor = [UIColor redColor];
            self.gView.backgroundColor = [UIColor redColor];
            self.hView.backgroundColor = [UIColor redColor];
            self.iView.backgroundColor = [UIColor redColor];
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
    
    
    
}

-(void)createResultStringWithArray:(NSArray *)resultArray{
    NSString *result = [NSString string];
    for (int i =0; i < [resultArray count]; i++) {
        result = [result stringByAppendingString:[NSString stringWithFormat:@"%@", [resultArray objectAtIndex:i]]];
    }
    [self getOLLInformation:result];
}

-(void)getOLLInformation:(NSString *)OLLKey {
    
     NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"OLL" inManagedObjectContext:[[StorageManager sharedManager] managedObjectContext]];
     [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"binary == %@", OLLKey];
    [fetchRequest setPredicate:predicate];
    
     NSError *error;
     NSArray *result = [[[StorageManager sharedManager]managedObjectContext] executeFetchRequest:fetchRequest error:&error];
     
     self.selectedOLL = [result objectAtIndex:0];
    
    
}
@end
