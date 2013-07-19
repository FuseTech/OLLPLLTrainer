//
//  StorageManager.h
//  OLLPLL
//
//  Created by Weston Chambers on 7/18/13.
//  Copyright (c) 2013 Weston Chambers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StorageManager : NSObject

+ (StorageManager *)sharedManager;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// \brief Fetches an NSManagedObject instance with the given name and predicate. Pass nil if no predicate is needed
// \param name The entity name of the NSManagedObject
// \param predicate An instance of NSPredicate used to filter the object returned
// \returns An instance of NSManagedObject or a subclass thereof
- (id)fetchObjectWithName:(NSString *)name withPredicate:(NSPredicate *)predicate;

// \brief Fetches an array of NSManagedObject instances with the given name, predicate, and sort descriptors. Pass nil if no predicate or sort descriptors are needed
// \param name The entity name of the NSManagedObject
// \param predicate An instance of NSPredicate used to filter the objects returned
// \param sortDescriptors An array of NSSortDescriptor objects used to sort the fetched results
// \returns An array of NSManagedObjects or subclasses thereof
- (NSArray *)fetchObjectsWithName:(NSString *)name withPredicate:(NSPredicate *)predicate sortDescriptors:(NSArray *)sortDescriptors;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
