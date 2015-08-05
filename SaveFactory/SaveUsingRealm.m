//
//  SaveUsingRealm.m
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 3..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import "SaveUsingRealm.h"
#import <Realm/Realm.h>

// Data model
@interface Data : RLMObject
@property NSString *key;
@property id value;
@end

// Implementations
@implementation Data
@end // none needed

@implementation SaveUsingRealm

static SaveUsingRealm *sharedMyObject = nil;

+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyObject = [[super alloc] init];
    });
    return sharedMyObject;
}

- (void)create {
}

- (id)readDataUsingKey:(NSString *)key {
    NSString *query = [NSString stringWithFormat:@"key = '%@'",key];
    RLMResults *datas = [Data objectsWhere:query];
    return [datas firstObject];
}

- (void)removeDataUsingKey:(NSString *)key {
    NSString *query = [NSString stringWithFormat:@"key = '%@'",key];
    RLMResults *datas = [Data objectsWhere:query];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObjects:datas];
    [realm commitWriteTransaction];
    
}
- (void)writeDataUsingKey:(NSString *)key Value:(id)value {
    // Create object
    Data *data = [[Data alloc]init];
    data.key = key;
    data.value = value;
    
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:data];
    [realm commitWriteTransaction];
}

@end
