//
//  LPSessionService.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LPSessionServiceType) {
  LPSessionServiceTypeFacebook,
  LPSessionServiceTypeTwitter,
  LPSessionServiceTypeSinaWeibo,
  LPSessionServiceTypeEmail
};

@protocol LPSessionServiceDelegate <NSObject>

@optional

- (void)sessionDidLogin:(id)responseObject;
- (void)sessionDidLogout;
- (void)sessionDidError:(NSString *)errorMessage;

@end

@protocol LPSessionService <NSObject>

- (void)login;
- (void)logout;

@end
