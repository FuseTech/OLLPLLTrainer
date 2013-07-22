//
//  Entity.h
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/21/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class OLL;

@interface Binary : NSManagedObject

@property (nonatomic, retain) NSString * binary;
@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSString * setup;
@property (nonatomic, retain) OLL *oll;

@end
