//
//  LPSessionPersistenceBuilder.m
//  LuxPix
//
//  Created by Mark Edmunds on 12/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSessionPersistenceBuilder.h"
#import "LPUserDefaultsPersistence.h"

@implementation LPSessionPersistenceBuilder

+ (id<LPSessionPersistence>)persistenceWithType:(LPSessionPersistenceType)persistenceType {
	switch (persistenceType) {
		case LPSessionPersistenceTypeUserDefaults:
			return [[LPUserDefaultsPersistence alloc] init];
			break;
		default:
			return nil;
			break;
	}
}

@end