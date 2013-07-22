//
//  OLL.h
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/21/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserOLL;

@interface OLL : NSManagedObject

@property (nonatomic, retain) NSString * algorithm;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) UserOLL *userOLLData;

@end
