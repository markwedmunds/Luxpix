//
//  LPSessionPersistenceBuilder.h
//  LuxPix
//
//  Created by Mark Edmunds on 12/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPSessionPersistence.h"

@interface LPSessionPersistenceBuilder : NSObject

+ (id<LPSessionPersistence>)persistenceWithType:(LPSessionPersistenceType)persistenceType;

@end
