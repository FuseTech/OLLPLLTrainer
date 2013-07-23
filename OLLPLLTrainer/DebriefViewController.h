//
//  DebriefViewController.h
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/19/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OLL;

@interface DebriefViewController : UIViewController
@property (nonatomic) BOOL succeeded;
@property (nonatomic, strong) OLL *completedOLL;

@end
