//
//  OLLDetailViewController.m
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import "OLLDetailViewController.h"
#import "OLL.h"

@interface OLLDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *OLLimageView;
@property (weak, nonatomic) IBOutlet UILabel *OLLKeyLabel;
@property (weak, nonatomic) IBOutlet UILabel *OLLDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *algorithmLabel;

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
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
