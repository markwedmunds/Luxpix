//
//  LPSession.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSessionService.h"
#import <Foundation/Foundation.h>

@interface LPSession : NSObject

@property(assign) LPSessionServiceType serviceType;
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *email;

- (id)initWithJSON:(id)jsonObject;

@end
