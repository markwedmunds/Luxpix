//
//  LPSessionServiceBuilder.h
//  LuxPix
//
//  Created by Mark Edmunds on 09/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPSessionService.h"

@interface LPSessionServiceBuilder : NSObject

+ (id<LPSessionService>)serviceWithType:(LPSessionServiceType)serviceType delegate:(id<LPSessionServiceDelegate>)delegate;

@end
