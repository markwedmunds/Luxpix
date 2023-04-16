//
//  LPTwitterSessionService.h
//  LuxPix
//
//  Created by Mark Edmunds on 13/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPSessionService.h"

@interface LPTwitterSessionService : NSObject <LPSessionService>

@property (weak, nonatomic) id<LPSessionServiceDelegate> delegate;

- (id)initWithDelegate:(id<LPSessionServiceDelegate>)delegate;

@end
