//
//  LPSession.m
//  LuxPix
//
//  Created by Mark Edmunds on 09/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSession.h"

@implementation LPSession

- (id)initWithJSON:(id)jsonObject {
	self = [super init];
    if (self) {
		[self populateFromJSON:jsonObject];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        _serviceType = [decoder decodeIntegerForKey:@"serviceType"];
        _name = [decoder decodeObjectForKey:@"name"];
        _email = [decoder decodeObjectForKey:@"email"];
    }
    return self;
}

- (void)populateFromJSON:(id)jsonObject {
	if (jsonObject) {
		_name = jsonObject[@"name"];
		_email = jsonObject[@"email"];
	}
}

- (void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeInteger:_serviceType forKey:@"serviceType"];
	[encoder encodeObject:_name forKey:@"name"];
	[encoder encodeObject:_email forKey:@"email"];
}

@end
