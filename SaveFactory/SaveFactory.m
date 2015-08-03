//
//  SaveFactory.m
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 3..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import "SaveFactory.h"
#import "SaveUsingPlist.h"

@implementation SaveFactory

+(id<SaveObject>)saveObjectUsingKey:(NSString *)key {
    if ([key isEqualToString:@"plist"]) {
        return [SaveUsingPlist sharedInstance];
    }
    return nil;
}

@end
