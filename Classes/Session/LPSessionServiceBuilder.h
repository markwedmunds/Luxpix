//
//  LPSessionServiceBuilder.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSessionService.h"
#import <Foundation/Foundation.h>

@interface LPSessionServiceBuilder : NSObject

+ (id<LPSessionService>)serviceWithType:(LPSessionServiceType)serviceType
                               delegate:(id<LPSessionServiceDelegate>)delegate;

@end
