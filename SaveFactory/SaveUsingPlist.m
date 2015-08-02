//
//  SaveUsingPlist.m
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 1..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import "SaveUsingPlist.h"

@implementation SaveUsingPlist

static SaveUsingPlist *sharedMyObject = nil;

+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyObject = [[super alloc] init];
    });
    return sharedMyObject;
}

- (void)create {
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:path])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath:path error:&error];
    }
}

- (void)writeDataUsingKey:(NSString *)key Value:(id)value {
    @synchronized(self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
    
        NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        [data setObject:value forKey:key];
        [data writeToFile:path atomically:YES];
    }
}

- (id)readDataUsingKey:(NSString *)key {
    @synchronized(self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
        NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        return [savedStock objectForKey:key];
    }
}

- (void)removeDataUsingKey:(NSString *)key {
    @synchronized(self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"data.plist"];
        NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        [savedStock removeObjectForKey:key];
    }
}


@end
