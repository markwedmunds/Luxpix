//
//  LPSessionController.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPSessionPersistenceBuilder.h"
#import "LPSessionServiceBuilder.h"
#import <Foundation/Foundation.h>

@protocol LPSessionControllerDelegate <NSObject>

@optional

- (void)sessionDidLogin;
- (void)sessionDidLogout;
- (void)sessionDidError:(NSString *)errorMessage;

@end

@interface LPSessionController : NSObject <LPSessionServiceDelegate>

@property(assign) LPSessionServiceType serviceType;

@property(strong, nonatomic) LPSession *session;

@property(weak, nonatomic) id<LPSessionControllerDelegate> delegate;
@property(strong, nonatomic) id<LPSessionService> service;
@property(strong, nonatomic) id<LPSessionPersistence> persistence;

+ (LPSessionController *)sharedInstance;

- (id)initWithPersistenceType:(LPSessionPersistenceType)persistenceType;

- (void)setServiceWithServiceType:(LPSessionServiceType)serviceType;
- (void)setPersistenceWithPersistenceType:
    (LPSessionPersistenceType)persistenceType;

- (void)login;
- (void)logout;
- (void)backgroundLogin;

@end
