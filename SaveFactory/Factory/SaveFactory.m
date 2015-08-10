//
//  SaveFactory.m
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 3..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import "SaveFactory.h"
#import "SaveUsingPlist.h"
#import "SaveUsingCoreData.h"
#import "SaveUsingRealm.m"

@implementation SaveFactory

+(id<SaveObject>)saveObjectUsingKey:(NSString *)key {
    if ([key isEqualToString:@"plist"]) {
        return [SaveUsingPlist sharedInstance];
    }
    else if ([key isEqualToString:@"coredata"]) {
        return [SaveUsingCoreData sharedInstance];
    }
    else if ([key isEqualToString:@"realm"]) {
        return [SaveUsingRealm sharedInstance];
    }
    return nil;
}

@end
