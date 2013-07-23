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
#import "UserOLL.h"

@interface OLLDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *OLLimageView;
@property (weak, nonatomic) IBOutlet UILabel *ollIdentifierLabel;
@property (weak, nonatomic) IBOutlet UILabel *successPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *confidenceRatingLabel;

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

    
    //Just used for testing. Bulk will be in next VC
    
   // NSFetchRequest *request = [[NSFetchRequest alloc] init];
   // NSEntityDescription *entity = [NSEntityDescription entityForName:@"userOLL" inManagedObjectContext:[[StorageManager sharedManager]managedObjectContext]];
    
    self.userOLLData = self.detailOLL.userOLLData;
    if (!self.userOLLData) {
        //Currently no userOLL for this OLL
        self.myStatsButton.hidden = YES;
        self.confidenceRatingLabel.hidden = YES;
        self.successPercentageLabel.hidden = YES;
        self.ollIdentifierLabel.text = self.detailOLL.desc;
    } else {
        self.ollIdentifierLabel.text = self.detailOLL.userOLLData.userKey;
        self.confidenceRatingLabel.text = [NSString stringWithFormat:@"%@",self.userOLLData.confidenceRating];
        //calculate success percentage
        int pass = [self.detailOLL.userOLLData.numSolves intValue];
        int attempts = [self.detailOLL.userOLLData.numAttempts intValue];
        float percentage = (((float) pass) / attempts);
        self.successPercentageLabel.text = [NSString stringWithFormat:@"%%%.2f success rate", percentage *100];
    }
    self.OLLimageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.gif",self.detailOLL.key]];
    
    
                            
    

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
