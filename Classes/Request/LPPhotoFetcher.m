//
//  LPPhotoFetcher.m
//  LuxPix
//
//  Created by Mark Edmunds on 04/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPPhotoFetcher.h"
#import "LPPhoto.h"
#import "NSDate+NVTimeAgo.h"

@implementation LPPhotoFetcher

+ (NSArray *)getLatestPhotosWithLimit:(NSInteger *)limit {
	NSMutableArray *photos = [[NSMutableArray alloc] init];

	NSDate *date = [NSDate date];

	for (int i = 0; i < (int)limit; i++) {
		LPPhoto *photo = [[LPPhoto alloc] init];
		photo.username = @"@markwedmunds";
		photo.photoURI = [NSString stringWithFormat:@"http://lorempixel.com/300/300/nature/%d", (i % 10) + 1];
		photo.rating = (i % 5) + 1;
		photo.timeAgo = [date formattedAsTimeAgo];
		[photos addObject:photo];
	}

	return [NSArray arrayWithArray:photos];
}

@end
