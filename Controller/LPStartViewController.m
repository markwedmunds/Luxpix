//
//  LPStartViewController.m
//  LuxPix
//
//  Created by Mark Edmunds on 02/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPStartViewController.h"
#import "LPAppDelegate.h"

@implementation LPStartViewController

- (void)viewDidAppear:(BOOL)animated {
	_logo.alpha = 0;

	[self performAnimations];
}

- (void)performAnimations {
	[UIView animateWithDuration:0.5
						  delay:0.5
						options:UIViewAnimationOptionCurveEaseIn
					 animations:^{ _logo.alpha = 1; }
					 completion:nil];
}

@end
