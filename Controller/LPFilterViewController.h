//
//  LPFilterViewController.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPFilterOptionsViewController.h"
#import <UIKit/UIKit.h>

@interface LPFilterViewController : UIViewController <LPFilterOptionsDelegate>

@property(weak, nonatomic) IBOutlet UIImageView *imagePreview;

- (void)setPreviewImage:(UIImage *)image;
- (IBAction)nextClicked:(id)sender;

@end
