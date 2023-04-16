//
//  LPSessionPersistenceBuilder.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPSessionPersistence.h"
#import <Foundation/Foundation.h>

@interface LPSessionPersistenceBuilder : NSObject

+ (id<LPSessionPersistence>)persistenceWithType:
    (LPSessionPersistenceType)persistenceType;

@end
