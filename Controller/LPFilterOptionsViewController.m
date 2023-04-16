//
//  LPFilterOptionsViewController.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPFilterOptionsViewController.h"

@implementation LPFilterOptionsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (IBAction)applyFilterSepia:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeSepia];
}

- (IBAction)applyFilterVignette:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeVignette];
}

- (IBAction)applyFilterTemperature:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeTemperature];
}

- (IBAction)applyFilterColorInvert:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeColorInvert];
}

- (IBAction)applyFilterHue:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeHue];
}

- (IBAction)applyFilterExposure:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeExposure];
}

- (IBAction)applyFilterHighlightShadow:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeHighlightShadow];
}

- (IBAction)applyFilterColorControl:(id)sender {
  [_delegate applyFilter:UIImageFilterTypeColorControl];
}

@end
