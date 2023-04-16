//
//  LPPhotoFetcher.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPPhotoFetcher : NSObject

+ (NSArray *)getLatestPhotosWithLimit:(NSInteger *)limit;

@end
