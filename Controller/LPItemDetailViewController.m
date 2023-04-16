//
//  LPItemDetailViewController.m
//  LuxPix
//
//  Created by Mark Edmunds on 04/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPItemDetailViewController.h"
#import "LPCustomTableViewCell.h"
#import <UIImageView+UIActivityIndicatorForSDWebImage.h>

@implementation LPItemDetailViewController

- (void)viewDidLoad {
	[_rating setMarkCharacter:@"\u2665"];
	_rating.markFont = [UIFont systemFontOfSize:14.0];
	[_rating setStepInterval:1.0];
	[_rating setUserInteractionEnabled:NO];
	[_rating sizeToFit];
	[_rating setBaseColor:[UIColor grayColor]];
	[_rating setHighlightColor:[UIColor whiteColor]];

	if (_photo != nil) {
		[_imagePreview setImageWithURL:[NSURL URLWithString:_photo.photoURI]
					  placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]
		   usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

		_usernameLabel.text = _photo.username;
		_timeLabel.text = _photo.timeAgo;
		[_rating setValue:_photo.rating];
	}
}

@end
