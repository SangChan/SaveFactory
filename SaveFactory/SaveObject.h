//
//  SaveObject.h
//  SaveFactory
//
//  Created by LeeSangchan on 2015. 8. 1..
//  Copyright (c) 2015년 LeeSangchan. All rights reserved.
//

#ifndef SaveFactory_SaveObject_h
#define SaveFactory_SaveObject_h


#endif
@protocol SaveObject <NSObject>
- (void)create;
- (id)readDataUsingKey:(NSString *)key;
- (void)removeDataUsingKey:(NSString *)key;
- (void)writeDataUsingKey:(NSString *)key Value:(id)value;
@end