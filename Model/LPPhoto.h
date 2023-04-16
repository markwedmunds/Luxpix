//
//  LPPhoto.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPPhoto : NSObject

@property(strong, nonatomic) NSString *username;
@property(strong, nonatomic) NSString *photoURI;
@property(assign) float rating;
@property(strong, nonatomic) NSString *timeAgo;

@end
