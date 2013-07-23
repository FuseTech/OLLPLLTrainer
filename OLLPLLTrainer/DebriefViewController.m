//
//  DebriefViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "DebriefViewController.h"
#import "OLL.h"
#import "UserOLL.h"
#import "StorageManager.h"

@interface DebriefViewController () <UITextFieldDelegate, UITextViewDelegate>
- (IBAction)donePressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *ollImageView;
@property (weak, nonatomic) IBOutlet UITextField *identifierTextField;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UISlider *confidenceSlider;
@property (weak, nonatomic) IBOutlet UILabel *confidenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *successLabel;
@property (weak, nonatomic) IBOutlet UILabel *attemptsLabel;

- (IBAction)confidenceSliderChanged:(id)sender;
@end

@implementation DebriefViewController

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
 
    if (!self.completedOLL.userOLLData) {
        //no data yet, create a record
        UserOLL *theUsersOLL = [NSEntityDescription insertNewObjectForEntityForName:@"UserOLL" inManagedObjectContext:[[StorageManager sharedManager]managedObjectContext]];
        theUsersOLL.numAttempts = [NSNumber numberWithInt:0];
        if (self.succeeded) {
            theUsersOLL.numSolves = [NSNumber numberWithInt:0];
        } else if (!self.succeeded) {
            theUsersOLL.numSolves = [NSNumber numberWithInt:0];
        }
        theUsersOLL.confidenceRating = [NSNumber numberWithInt:0];
        theUsersOLL.parentOLL = self.completedOLL;
        
        self.identifierTextField.text = self.completedOLL.desc;
        NSError *error;
        if(![[StorageManager sharedManager].managedObjectContext save:&error]){
            NSLog(@"Error saving UserOLL");
        }
    }
    self.successLabel.text = [NSString stringWithFormat:@"%@", self.completedOLL.userOLLData.numSolves];
    self.attemptsLabel.text = [NSString stringWithFormat:@"%@", self.completedOLL.userOLLData.numAttempts];
    int pass = [self.completedOLL.userOLLData.numSolves intValue];
    int attempts = [self.completedOLL.userOLLData.numAttempts intValue];
    float percentage = (((float) pass) / attempts);
    self.percentageLabel.text = [NSString stringWithFormat:@"%.2f", percentage*100];
    if (self.succeeded) {
        self.title = @"Good job!";
    } else {
        self.title = @"A valiant attempt!";
    }
    self.ollImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.gif",self.completedOLL.key]];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)donePressed:(id)sender {
    
     
  //[self performSegueWithIdentifier:@"doneDebriefingSegue" sender:self];
   
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"doneDebriefingSegue"]) {
        //save userkey, notes and confidence rating
        if (![self.identifierTextField.text isEqualToString:self.completedOLL.desc]) {
            //User input their own identifier
            self.completedOLL.userOLLData.userKey = self.identifierTextField.text;
        }
        self.completedOLL.userOLLData.userNotes = self.notesTextView.text;
        self.completedOLL.userOLLData.confidenceRating = [NSNumber numberWithFloat:self.confidenceSlider.value];
        
        
    }
}
- (IBAction)confidenceSliderChanged:(id)sender {
    self.confidenceLabel.text = [NSString stringWithFormat:@"%f", self.confidenceSlider.value];
}
@end
