//
//  LPFacebookSessionService.m
//  LuxPix
//
//  Created by Mark Edmunds on 21/07/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPFacebookSessionService.h"
#import "SimpleAuth.h"
#import <Accounts/Accounts.h>

@implementation LPFacebookSessionService

- (id)initWithDelegate:(id<LPSessionServiceDelegate>)delegate {
	self = [super init];
    if (self) {
		_delegate = delegate;
		[self configureAuthorizationProviders];
    }
    return self;
}

- (void)configureAuthorizationProviders {
	SimpleAuth.configuration[@"facebook"] = @{
		@"app_id": @"",
		@"permissions": @[ @"email" ]
	};
}

- (void)login {
	[SimpleAuth authorize:@"facebook" completion:^(id responseObject, NSError *error) {
		if (error == nil) {
			if (responseObject != nil && responseObject[@"info"]) {
				[_delegate sessionDidLogin:responseObject[@"info"]];
			} else {
				[self raiseError:@"Account information not returned."];
			}
		} else {
			if ([error code] == ACErrorAccountNotFound) {
				[self raiseError:@"Account not found. Please setup your account in settings app."];
			} else {
				[self raiseError:[NSString stringWithFormat:@"Account access denied. %@", error]];
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
