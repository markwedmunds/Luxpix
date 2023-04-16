//
//  LPSessionController.m
//  LuxPix
//
//  Created by Mark Edmunds on 21/07/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSessionController.h"

@implementation LPSessionController

+ (LPSessionController *)sharedInstance {
	static LPSessionController *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;

    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LPSessionController alloc] initWithPersistenceType:LPSessionPersistenceTypeUserDefaults];
    });

    return _sharedInstance;
}

- (id)initWithPersistenceType:(LPSessionPersistenceType)persistenceType {
	self = [self init];
    if (self) {
		[self setPersistenceWithPersistenceType:persistenceType];
    }
    return self;
}

- (void)setServiceWithServiceType:(LPSessionServiceType)serviceType {
	_serviceType = serviceType;
	_service = [LPSessionServiceBuilder serviceWithType:serviceType delegate:self];
}

- (void)setPersistenceWithPersistenceType:(LPSessionPersistenceType)persistenceType {
	_persistence = [LPSessionPersistenceBuilder persistenceWithType:persistenceType];
}

- (void)login {
	[_service login];
}

- (void)logout {
	[_service logout];
}

- (void)backgroundLogin {
	_session = [_persistence loadSession];
	if (_session) {
		[self setServiceWithServiceType:[_session serviceType]];
		[_delegate sessionDidLogin];
	}
}

- (void)sessionDidLogin:(id)responseObject {
	_session = [[LPSession alloc] initWithJSON:responseObject];
	[_session setServiceType:_serviceType];
	[_persistence saveSession:_session];
	[_delegate sessionDidLogin];
}

- (void)sessionDidLogout {
	[_persistence clearSession];
	[_delegate sessionDidLogout];
}

- (void)sessionDidError:(NSString *)errorMessage {
	[_delegate sessionDidError:errorMessage];
}

@end
