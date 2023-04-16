//
//  LPCustomTableViewCell.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <AXRatingView.h>
#import <UIKit/UIKit.h>

@interface LPCustomTableViewCell : UITableViewCell

@property(weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property(weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property(weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(weak, nonatomic) IBOutlet AXRatingView *rating;

@end
