//
//  SaveUsingPlist.m
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 1..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import "SaveUsingPlist.h"

@implementation SaveUsingPlist

+(instancetype)sharedInstance {
    static SaveUsingPlist *sharedMyObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyObject = [[super alloc] init];
    });
    return sharedMyObject;
}

- (NSString *)path {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
}

- (void)create {
    NSError *error;
    NSString *path = [self path];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:path])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:path error:&error];
    }
}

- (void)writeDataUsingKey:(NSString *)key Value:(id)value {
    @synchronized(self) {
        NSString *path = [self path];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        [data setObject:value forKey:key];
        [data writeToFile:path atomically:YES];
    }
}

- (id)readDataUsingKey:(NSString *)key {
    @synchronized(self) {
        NSString *path = [self path];
        NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        return [savedStock objectForKey:key];
    }
}

- (void)removeDataUsingKey:(NSString *)key {
    @synchronized(self) {
        NSString *path = [self path];
        NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        [savedStock removeObjectForKey:key];
    }
}


@end
