//
//  LPFacebookSessionService.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPSessionService.h"
#import <Foundation/Foundation.h>

@interface LPFacebookSessionService : NSObject <LPSessionService>

@property(weak, nonatomic) id<LPSessionServiceDelegate> delegate;

- (id)initWithDelegate:(id<LPSessionServiceDelegate>)delegate;

@end
