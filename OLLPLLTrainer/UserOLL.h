//
//  UserOLL.h
//  OLLPLL
//
//  Created by Weston Chambers on 7/18/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class OLL;

@interface UserOLL : NSManagedObject

@property (nonatomic, retain) NSString * userKey;
@property (nonatomic, retain) NSString * userNotes;
@property (nonatomic, retain) NSNumber * skipFlag;
@property (nonatomic, retain) NSString * seenBefore;
@property (nonatomic, retain) NSNumber * numAttempts;
@property (nonatomic, retain) NSNumber * numSolves;
@property (nonatomic, retain) NSNumber * confidenceRating;
@property (nonatomic, retain) OLL *parentOLL;

@end
