//
//  LPCameraViewController.h
//  LuxPix
//
//  Created by Mark Edmunds on 16/07/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPCameraViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *videoPreview;

- (IBAction)takePhoto:(id)sender;
- (IBAction)closeCamera:(id)sender;

@end
