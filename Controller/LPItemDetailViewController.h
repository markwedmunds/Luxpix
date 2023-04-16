//
//  LPItemDetailViewController.h
//  LuxPix
//
//  Created by Mark Edmunds on 04/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AXRatingView.h>
#import "LPPhoto.h"

@interface LPItemDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imagePreview;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet AXRatingView *rating;

@property (strong, nonatomic) LPPhoto *photo;

@end
