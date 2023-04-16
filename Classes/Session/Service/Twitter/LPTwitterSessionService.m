//
//  LPTwitterSessionService.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPTwitterSessionService.h"
#import "SimpleAuth.h"
#import <Accounts/Accounts.h>

@implementation LPTwitterSessionService

- (id)initWithDelegate:(id<LPSessionServiceDelegate>)delegate {
  self = [super init];
  if (self) {
    _delegate = delegate;
    [self configureAuthorizationProviders];
  }
  return self;
}

- (void)configureAuthorizationProviders {
  SimpleAuth.configuration[@"twitter"] =
      @{@"consumer_key" : @"", @"consumer_secret" : @""};
}

- (void)login {
  [SimpleAuth
       authorize:@"twitter"
      completion:^(id responseObject, NSError *error) {
        if (error == nil) {
          if (responseObject != nil && responseObject[@"info"]) {
            [_delegate sessionDidLogin:responseObject[@"info"]];
          } else {
            [self raiseError:@"Account information not returned."];
          }
        } else {
          if ([error code] == ACErrorAccountNotFound) {
            [self raiseError:@"Account not found. Please setup your account in "
                             @"settings app."];
          } else {
            [self raiseError:[NSString
                                 stringWithFormat:@"Account access denied. %@",
                                                  error]];
          }
        }
      }];
}

- (void)logout {
  [_delegate sessionDidLogout];
}

- (void)raiseError:(NSString *)errorMessage {
  if ([_delegate respondsToSelector:@selector(sessionDidError:)]) {
    [_delegate sessionDidError:errorMessage];
  }
}

@end
