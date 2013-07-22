//
//  SettingsViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
- (IBAction)bottomFaceChanged:(id)sender;
- (IBAction)frontFaceChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *frontFaceSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *bottomFaceSegment;

@property (nonatomic, strong) NSString *bottomColor;
@property (nonatomic, strong) NSString *frontColor;
@property (nonatomic, strong) NSString *rightColor;
@property (nonatomic, strong) NSString *topColor;
@property (nonatomic, strong) NSString *leftColor;
@property (nonatomic, strong) NSString *backColor;

- (IBAction)donePressed:(id)sender;



@end

@implementation SettingsViewController

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

-(void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *botPref = [defaults objectForKey:@"Bottom"];
    
    NSLog(@"%@ is botPref and %@ is frontPref", botPref, [defaults objectForKey:@"Front"]);
    if ([botPref isEqualToString:@"White"]) {
        self.bottomFaceSegment.selectedSegmentIndex = 0;
        self.bottomColor = @"White";
    } else if ([botPref isEqualToString:@"Yellow"]){
        self.bottomFaceSegment.selectedSegmentIndex = 5;
        self.bottomColor = @"Yellow";
    } else if ([botPref isEqualToString:@"Green"]) {
        self.bottomFaceSegment.selectedSegmentIndex = 1;
        self.bottomColor = @"Green";
    } else if ([botPref isEqualToString:@"Orange"]) {
        self.bottomFaceSegment.selectedSegmentIndex = 2;
        self.bottomColor = @"Orange";
    } else if ([botPref isEqualToString:@"Blue"]) {
        self.bottomFaceSegment.selectedSegmentIndex = 3;
        self.bottomColor = @"Blue";
    } else if ([botPref isEqualToString:@"Red"]) {
        self.bottomFaceSegment.selectedSegmentIndex = 4;
        self.bottomColor = @"Red";
    }
    
    NSString *frontPref = [defaults objectForKey:@"Front"];
    if ([frontPref isEqualToString:@"White"]) {
        self.frontFaceSegment.selectedSegmentIndex = 0;
        self.frontColor = @"White";
    } else if ([frontPref isEqualToString:@"Yellow"]){
        self.frontFaceSegment.selectedSegmentIndex = 5;
        self.frontColor = @"Yellow";
    } else if ([frontPref isEqualToString:@"Green"]) {
        self.frontFaceSegment.selectedSegmentIndex = 1;
        self.frontColor = @"Green";
    } else if ([frontPref isEqualToString:@"Orange"]) {
        self.frontFaceSegment.selectedSegmentIndex = 2;
        self.frontColor = @"Orange";
    } else if ([frontPref isEqualToString:@"Blue"]) {
        self.frontFaceSegment.selectedSegmentIndex = 3;
        self.frontColor = @"Blue";
    } else if ([frontPref isEqualToString:@"Red"]) {
        self.frontFaceSegment.selectedSegmentIndex = 4;
        self.frontColor = @"Red";
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bottomFaceChanged:(id)sender {
    self.bottomColor = [self.bottomFaceSegment titleForSegmentAtIndex:self.bottomFaceSegment.selectedSegmentIndex];
   //Disable incompatible front face options
    [self.frontFaceSegment setEnabled:YES forSegmentAtIndex:0];
    [self.frontFaceSegment setEnabled:YES forSegmentAtIndex:1];
    [self.frontFaceSegment setEnabled:YES forSegmentAtIndex:2];
    [self.frontFaceSegment setEnabled:YES forSegmentAtIndex:3];
    [self.frontFaceSegment setEnabled:YES forSegmentAtIndex:4];
    [self.frontFaceSegment setEnabled:YES forSegmentAtIndex:5];
    
    
    if ([self.bottomColor isEqualToString:@"Yellow"]) {
        self.topColor = @"White";
     
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:0];
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:5];
    } else if ([self.bottomColor isEqualToString:@"White"]) {
        self.topColor = @"Yellow";
        
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:0];
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:5];
    } else if ([self.bottomColor isEqualToString:@"Red"]) {
        self.topColor = @"Orange";
       
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:4];
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:2];
    } else if ([self.bottomColor isEqualToString:@"Orange"]) {
        self.topColor = @"Red";
     
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:4];
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:2];
    } else if ([self.bottomColor isEqualToString:@"Blue"]) {
        self.topColor = @"Green";
      
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:3];
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:1];
    } else if ([self.bottomColor isEqualToString:@"Green"]) {
        self.topColor = @"Blue";
    
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:3];
        [self.frontFaceSegment setEnabled:NO forSegmentAtIndex:1];
    }
    
    NSLog(@"%@ is bottom, %@ is top", self.bottomColor, self.topColor);
    
}

- (IBAction)frontFaceChanged:(id)sender {
    self.frontColor = [self.frontFaceSegment titleForSegmentAtIndex:self.frontFaceSegment.selectedSegmentIndex];
    if ([self.frontColor isEqualToString:@"Yellow"]) {
        self.backColor = @"White";
    } else if ([self.frontColor isEqualToString:@"White"]) {
        self.backColor = @"Yellow";
    } else if ([self.frontColor isEqualToString:@"Red"]) {
        self.backColor = @"Orange";
    } else if ([self.frontColor isEqualToString:@"Orange"]) {
        self.backColor = @"Red";
    } else if ([self.frontColor isEqualToString:@"Blue"]) {
        self.backColor = @"Green";
    } else if ([self.frontColor isEqualToString:@"Green"]) {
        self.backColor = @"Blue";
    }
    NSLog(@"%@ is front, %@ is back", self.frontColor, self.backColor);
}
- (IBAction)donePressed:(id)sender {
    //Take the values of the segments and determine the color of all faces. Store in user defaults for access later in program
    if (self.bottomFaceSegment.selectedSegmentIndex == -1 || self.frontFaceSegment.selectedSegmentIndex == -1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incomplete Form" message:@"Please select your preferred colors" delegate:Nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:self.bottomColor forKey:@"Bottom"];
    NSLog(@"%@ is self.bottomcolor", self.bottomColor);
    [prefs setObject:self.topColor forKey:@"Top"];
    [prefs setObject:self.frontColor forKey:@"Front"];
    NSLog(@"%@ is self.frontColor", self.frontColor);
    [prefs setObject:self.backColor forKey:@"Back"];
    
    //Determine the left and right faces
    if ([self.bottomColor isEqualToString:@"Yellow"]) {
        if ([self.frontColor isEqualToString:@"Green"]) {
            self.rightColor = @"Orange";
            self.leftColor = @"Red";
        } else if ([self.frontColor isEqualToString:@"Orange"]) {
            self.rightColor = @"Blue";
            self.leftColor = @"Green";
        } else if ([self.frontColor isEqualToString:@"Blue"]) {
            self.rightColor = @"Red";
            self.leftColor = @"Orange";
        } else if ([self.frontColor isEqualToString:@"Red"]) {
            self.rightColor = @"Green";
            self.leftColor = @"Blue";
        }
    } else if ([self.bottomColor isEqualToString:@"White"]) {
        if ([self.frontColor isEqualToString:@"Green"]) {
            self.rightColor = @"Red";
            self.leftColor = @"Orange";
        } else if ([self.frontColor isEqualToString:@"Red"]) {
            self.rightColor = @"Blue";
            self.leftColor = @"Green";
        } else if ([self.frontColor isEqualToString:@"Blue"]) {
            self.rightColor = @"Orange";
            self.leftColor = @"Red";
        } else if ([self.frontColor isEqualToString:@"Orange"]) {
            self.rightColor = @"Green";
            self.leftColor = @"Blue";
        }
    } else if ([self.bottomColor isEqualToString:@"Green"]) {
        if ([self.frontColor isEqualToString:@"White"]) {
            self.rightColor = @"Orange";
            self.leftColor = @"Red";
        } else if ([self.frontColor isEqualToString:@"Orange"]) {
            self.rightColor = @"Yellow";
            self.rightColor = @"White";
        } else if ([self.frontColor isEqualToString:@"Yellow"]) {
            self.rightColor = @"Red";
            self.leftColor = @"Orange";
        } else if ([self.frontColor isEqualToString:@"Red"]) {
            self.rightColor = @"White";
            self.leftColor = @"Yellow";
        }
    } else if ([self.bottomColor isEqualToString:@"Blue"]) {
        if ([self.frontColor isEqualToString:@"White"]) {
            self.rightColor = @"Red";
            self.leftColor = @"Orange";
        } else if ([self.frontColor isEqualToString:@"Red"]) {
            self.rightColor = @"Yellow";
            self.leftColor = @"White";
        } else if ([self.frontColor isEqualToString:@"Yellow"]) {
            self.rightColor = @"Orange";
            self.leftColor =@"Red";
        } else if ([self.frontColor isEqualToString:@"Orange"]) {
            self.rightColor = @"White";
            self.leftColor = @"Yellow";
        }
    } else if ([self.bottomColor isEqualToString:@"Red"]) {
        if ([self.frontColor isEqualToString:@"White"]) {
            self.rightColor = @"Green";
            self.leftColor = @"Blue";
        } else if ([self.frontColor isEqualToString:@"Green"]) {
            self.rightColor = @"Yellow";
            self.leftColor = @"White";
        } else if ([self.frontColor isEqualToString:@"Yellow"]) {
            self.rightColor = @"Blue";
            self.leftColor = @"Green";
        } else if ([self.frontColor isEqualToString:@"Blue"]) {
            self.rightColor = @"White";
            self.leftColor = @"Yellow";
        }
    } else if ([self.bottomColor isEqualToString:@"Orange"]) {
        if ([self.frontColor isEqualToString:@"White"]) {
            self.rightColor = @"Blue";
            self.leftColor = @"Green";
        } else if ([self.frontColor isEqualToString:@"Blue"]) {
            self.rightColor = @"Yellow";
            self.leftColor = @"White";
        } else if ([self.frontColor isEqualToString:@"Yellow"]) {
            self.rightColor = @"Green";
            self.leftColor = @"Blue";
        } else if ([self.frontColor isEqualToString:@"Green"]) {
            self.rightColor = @"White";
            self.leftColor = @"Yellow";
        }
    }
    
    [prefs setObject:self.rightColor forKey:@"Right"];
    [prefs setObject:self.leftColor forKey:@"Left"];
    [prefs synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
@end
