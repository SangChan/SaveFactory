//
//  SaveFactory.h
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 3..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SaveObject.h"

@interface SaveFactory : NSObject

+(id<SaveObject>)saveObjectUsingKey:(NSString *)key;

@end
