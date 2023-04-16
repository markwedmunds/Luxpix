//
//  LPSessionServiceBuilder.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSessionServiceBuilder.h"
#import "LPFacebookSessionService.h"
#import "LPTwitterSessionService.h"

@implementation LPSessionServiceBuilder

+ (id<LPSessionService>)serviceWithType:(LPSessionServiceType)serviceType
                               delegate:(id<LPSessionServiceDelegate>)delegate {
  switch (serviceType) {
  case LPSessionServiceTypeFacebook:
    return [[LPFacebookSessionService alloc] initWithDelegate:delegate];
    break;
  case LPSessionServiceTypeTwitter:
    return [[LPTwitterSessionService alloc] initWithDelegate:delegate];
    break;
  default:
    return nil;
    break;
  }
}

@end
