//
//  SaveUsingRealm.m
//  SaveFactory
//
//  Created by SangChan on 2015. 8. 10..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import "SaveUsingRealm.h"

// Data model
@interface DataForRealm : RLMObject
@property NSString *key;
@property NSDictionary *value;
@end

// Implementations
@implementation DataForRealm
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
    RLMResults *datas = [DataForRealm objectsWhere:query];
    return [datas firstObject];
}

- (void)removeDataUsingKey:(NSString *)key {
    NSString *query = [NSString stringWithFormat:@"key = '%@'",key];
    RLMResults *datas = [DataForRealm objectsWhere:query];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObjects:datas];
    [realm commitWriteTransaction];
    
}
- (void)writeDataUsingKey:(NSString *)key Value:(id)value {
    // Create object
    DataForRealm *data = [[DataForRealm alloc]init];
    data.key = key;
    data.value = [NSDictionary dictionaryWithDictionary:(NSDictionary *)value];
    
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:data];
    [realm commitWriteTransaction];
}

@end
