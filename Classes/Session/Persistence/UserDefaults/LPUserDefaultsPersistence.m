//
//  LPPropertyListPersistence.m
//  LuxPix
//
//  Created by Mark Edmunds on 13/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPUserDefaultsPersistence.h"

static NSString *const kSessionKey = @"session";

@implementation LPUserDefaultsPersistence

- (void)saveSession:(LPSession *)session {
	NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:session];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:encodedObject forKey:kSessionKey];
	[defaults synchronize];
}

- (LPSession *)loadSession {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *encodedObject = [defaults objectForKey:kSessionKey];
	LPSession *session = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
	return session;
}

- (void)clearSession {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults removeObjectForKey:kSessionKey];
}

@end
