//
//  LPCustomTableViewCell.h
//  LuxPix
//
//  Created by Mark Edmunds on 25/05/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AXRatingView.h>

@interface LPCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet AXRatingView *rating;

@end
