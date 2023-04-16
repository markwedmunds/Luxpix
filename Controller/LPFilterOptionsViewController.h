//
//  LPFilterOptionsViewController.h
//  LuxPix
//
//  Created by Mark Edmunds on 16/07/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Filters.h"

@protocol LPFilterOptionsDelegate <NSObject>

- (void)applyFilter:(UIImageFilterType)filterType;

@end

@interface LPFilterOptionsViewController : UIViewController

@property (weak, nonatomic) id <LPFilterOptionsDelegate> delegate;

- (IBAction)applyFilterSepia:(id)sender;
- (IBAction)applyFilterVignette:(id)sender;
- (IBAction)applyFilterTemperature:(id)sender;
- (IBAction)applyFilterColorInvert:(id)sender;
- (IBAction)applyFilterHue:(id)sender;
- (IBAction)applyFilterExposure:(id)sender;
- (IBAction)applyFilterHighlightShadow:(id)sender;
- (IBAction)applyFilterColorControl:(id)sender;

@end
