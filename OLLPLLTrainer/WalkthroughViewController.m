//
//  WalkthroughViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "WalkthroughViewController.h"
#import "OLL.h"
#import "DebriefViewController.h"
#import "UserOLL.h"
#import "StorageManager.h"

@interface WalkthroughViewController () <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *directiveLabel;
@property (nonatomic) BOOL success;
@property (readwrite, nonatomic) BOOL shouldPopAfterAppearing;

@property (strong, nonatomic) NSArray *directiveArray;
@property (nonatomic) int numDirectives;
@property (nonatomic) int currentDirectiveIndex;
@property (nonatomic) NSString *botColor;
- (IBAction)viewTapped:(UITapGestureRecognizer *)sender;
- (IBAction)messedUpPressed:(id)sender;


@end

@implementation WalkthroughViewController

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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.botColor = [defaults objectForKey:@"Bottom"];
    self.directiveArray = [self.theOLL.algorithm componentsSeparatedByString:@","];
    self.numDirectives = [self.directiveArray count];
    self.currentDirectiveIndex = 0;
    self.directiveLabel.text = [self.directiveArray objectAtIndex:self.currentDirectiveIndex];
    self.progressView.progress = 0;
    if (self.theOLL.userOLLData) {
        self.title = [NSString stringWithFormat:@"%@", self.theOLL.userOLLData.userKey];
    }else {
        self.title = self.theOLL.desc;
    }
    
    
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.shouldPopAfterAppearing) {
        [self allDone];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    if (self.currentDirectiveIndex == self.numDirectives -1) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:[NSString stringWithFormat:@"Is the %@ face properly oriented?", self.botColor] delegate:self cancelButtonTitle:@"No :(" destructiveButtonTitle:@"Yes!" otherButtonTitles: nil];
        actionSheet.tag = 1;
        [actionSheet showInView:self.view];
        return;
                                      
    }
    [self showNextDirective];
}

-(void)showNextDirective {
    self.currentDirectiveIndex++;
 
    //Determine when to stop
    if (self.currentDirectiveIndex == self.numDirectives - 1) {
        [self showLastDirective];
        return;
    }
    
    
    self.directiveLabel.text = [self.directiveArray objectAtIndex:self.currentDirectiveIndex];
    float progressFloat = (((float) self.currentDirectiveIndex+ 1) / self.numDirectives);
    self.progressView.progress = progressFloat;
}

-(void)showLastDirective {
    self.directiveLabel.text = [self.directiveArray objectAtIndex:self.currentDirectiveIndex];
    self.progressView.progress = 1;
    
    
    
    
}

- (IBAction)messedUpPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Good try" message:@"Don't give up. You will be a boss soon enough" delegate:Nil cancelButtonTitle:@"You're right" otherButtonTitles: nil];
    [alert show];
}
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        //Yes pressed
        self.success = YES;
        [self performSegueWithIdentifier:@"debriefSegue" sender:self];
    } else if (buttonIndex == 1) {
        //No pressed
        self.success = NO;
        [self performSegueWithIdentifier:@"debriefSegue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"debriefSegue"] ) {
        [segue.destinationViewController setCompletedOLL:self.theOLL];
        [segue.destinationViewController setSucceeded:self.success];
       
    }
    
}
-(IBAction)doneDebriefing:(UIStoryboardSegue *)segue {
    [[StorageManager sharedManager] saveContext];
    self.shouldPopAfterAppearing = YES;
    
}
-(void)allDone {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
