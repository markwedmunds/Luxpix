//
//  LPSession.h
//  LuxPix
//
//  Created by Mark Edmunds on 09/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPSessionService.h"

@interface LPSession : NSObject

@property (assign) LPSessionServiceType serviceType;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;

- (id)initWithJSON:(id)jsonObject;

@end
