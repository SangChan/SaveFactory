//
//  SaveUsingCoreData.h
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 3..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SaveObject.h"

@interface SaveUsingCoreData : NSObject<SaveObject>

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
