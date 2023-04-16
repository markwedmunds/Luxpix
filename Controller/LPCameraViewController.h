//
//  LPCameraViewController.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPCameraViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIView *videoPreview;

- (IBAction)takePhoto:(id)sender;
- (IBAction)closeCamera:(id)sender;

@end
