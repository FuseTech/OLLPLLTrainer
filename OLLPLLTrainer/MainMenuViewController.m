//
//  MainMenuViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()
- (IBAction)OLLPracticePressed:(id)sender;
- (IBAction)PLLPracticePressed:(id)sender;

@end

@implementation MainMenuViewController

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

- (IBAction)OLLPracticePressed:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"Bottom"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Go To Settings" message:@"Please navigate to the settings menu and select your preferred face colors" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    UIViewController *viewController = nil;
    viewController = [[UIStoryboard storyboardWithName:@"OLLStoryboard" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"InitialView"];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)PLLPracticePressed:(id)sender {
    UIViewController *viewController = nil;
    viewController = [[UIStoryboard storyboardWithName:@"PLLStoryboard" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
