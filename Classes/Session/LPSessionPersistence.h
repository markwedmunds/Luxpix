//
//  LPSessionPersistence.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSession.h"
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LPSessionPersistenceType) {
  LPSessionPersistenceTypeNone,
  LPSessionPersistenceTypeUserDefaults
};

@protocol LPSessionPersistence <NSObject>

- (void)saveSession:(LPSession *)session;
- (LPSession *)loadSession;
- (void)clearSession;

@end
