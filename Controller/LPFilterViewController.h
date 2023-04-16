//
//  LPFilterViewController.h
//  LuxPix
//
//  Created by Mark Edmunds on 16/07/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPFilterOptionsViewController.h"

@interface LPFilterViewController : UIViewController <LPFilterOptionsDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagePreview;

- (void)setPreviewImage:(UIImage *)image;
- (IBAction)nextClicked:(id)sender;

@end
