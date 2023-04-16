//
//  LPSessionPersistence.h
//  LuxPix
//
//  Created by Mark Edmunds on 09/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPSession.h"

typedef NS_ENUM(NSInteger, LPSessionPersistenceType) {
	LPSessionPersistenceTypeNone,
    LPSessionPersistenceTypeUserDefaults
};

@protocol LPSessionPersistence <NSObject>

- (void)saveSession:(LPSession *)session;
- (LPSession *)loadSession;
- (void)clearSession;

@end