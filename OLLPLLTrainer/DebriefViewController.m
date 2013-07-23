//
//  DebriefViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "DebriefViewController.h"

@interface DebriefViewController ()
- (IBAction)donePressed:(id)sender;

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
    if (self.succeeded) {
        self.title = @"Good job!";
    } else {
        self.title = @"A valiant attempt!";
    }
    
    
    
    
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
       // [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}
@end
