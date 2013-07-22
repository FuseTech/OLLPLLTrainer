//
//  OLL.h
//  OLLPLLTrainer
//
//  Created by Weston Chambers on 7/22/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Binary, UserOLL;

@interface OLL : NSManagedObject

@property (nonatomic, retain) NSString * algorithm;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) id image;
@property (nonatomic, retain) NSString * key;
@property (nonatomic, retain) NSSet *binary;
@property (nonatomic, retain) UserOLL *userOLLData;
@end

@interface OLL (CoreDataGeneratedAccessors)

- (void)addBinaryObject:(Binary *)value;
- (void)removeBinaryObject:(Binary *)value;
- (void)addBinary:(NSSet *)values;
- (void)removeBinary:(NSSet *)values;

@end
