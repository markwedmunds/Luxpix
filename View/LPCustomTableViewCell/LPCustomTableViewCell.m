//
//  LPCustomTableViewCell.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPCustomTableViewCell.h"

@implementation LPCustomTableViewCell

- (void)awakeFromNib {
  self.selectionStyle = UITableViewCellSelectionStyleNone;

  [self.rating setMarkCharacter:@"\u2665"];
  self.rating.markFont = [UIFont systemFontOfSize:14.0];
  [self.rating setStepInterval:1.0];
  [self.rating setUserInteractionEnabled:NO];
  [self.rating sizeToFit];
  [self.rating setBaseColor:[UIColor grayColor]];
  [self.rating setHighlightColor:[UIColor whiteColor]];
}

@end
