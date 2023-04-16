//
//  LPPhotoFetcher.h
//  LuxPix
//
//  Created by Mark Edmunds on 04/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPPhotoFetcher : NSObject

+ (NSArray *)getLatestPhotosWithLimit:(NSInteger *)limit;

@end
