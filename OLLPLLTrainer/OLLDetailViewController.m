//
//  OLLDetailViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "OLLDetailViewController.h"
#import "OLL.h"
#import "StorageManager.h"
#import "OLLStatsViewController.h"
#import "WalkthroughViewController.h"

@interface OLLDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *OLLimageView;
@property (weak, nonatomic) IBOutlet UILabel *OLLKeyLabel;
@property (weak, nonatomic) IBOutlet UILabel *OLLDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *algorithmLabel;
@property (weak, nonatomic) UserOLL *userOLLData;
@property (weak, nonatomic) IBOutlet UIButton *myStatsButton;
- (IBAction)myStatsPressed:(id)sender;

@end

@implementation OLLDetailViewController

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
    self.OLLKeyLabel.text = self.detailOLL.key;
    self.OLLDescLabel.text = self.detailOLL.desc;
    
    //Just used for testing. Bulk will be in next VC
    self.algorithmLabel.text = self.detailOLL.algorithm;
    
   // NSFetchRequest *request = [[NSFetchRequest alloc] init];
   // NSEntityDescription *entity = [NSEntityDescription entityForName:@"userOLL" inManagedObjectContext:[[StorageManager sharedManager]managedObjectContext]];
    
    self.userOLLData = self.detailOLL.userOLLData;
    if (!self.userOLLData) {
        //Currently no userOLL for this OLL, create one
        self.myStatsButton.hidden = YES;
    }
    self.OLLimageView.image = [self getImageFromString:self.detailOLL.key];
    
    
                            
    

}

-(UIImage *)getImageFromString:(NSString *)key {
    UIImage *theImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.gif",self.detailOLL.key]];
    return theImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myStatsPressed:(id)sender {
    [self performSegueWithIdentifier:@"statsSegue" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"statsSegue"]) {
        [segue.destinationViewController setOLLStats:self.userOLLData];
    } else if ([[segue identifier] isEqualToString:@"walkthroughSegue"]) {
        [segue.destinationViewController setTheOLL:self.detailOLL];
    }
    
}
@end
