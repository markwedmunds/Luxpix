//
//  LPItemDetailViewController.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPPhoto.h"
#import <AXRatingView.h>
#import <UIKit/UIKit.h>

@interface LPItemDetailViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIImageView *imagePreview;
@property(weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property(weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(weak, nonatomic) IBOutlet AXRatingView *rating;

@property(strong, nonatomic) LPPhoto *photo;

@end
