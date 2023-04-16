//
//  LPFilterViewController.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPFilterViewController.h"
#import "LPFilterOptionsViewController.h"
#import "LPShareViewController.h"
#import "UIImage+Filters.h"

@implementation LPFilterViewController {
  UIImage *_image;
  UIImage *_filteredImage;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  if (_image) {
    [_imagePreview setImage:_image];
  }
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)setPreviewImage:(UIImage *)image {
  _image = image;
}

- (void)applyFilter:(UIImageFilterType)filterType {
  NSOperationQueue *backgroundQueue = [NSOperationQueue new];
  [backgroundQueue addOperationWithBlock:^{
    _filteredImage = [_image imageWithFilter:filterType];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
      [_imagePreview setImage:_filteredImage];
    }];
  }];
}

- (IBAction)nextClicked:(id)sender {
  [self performSegueWithIdentifier:@"Share" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"FilterOptions"]) {
    LPFilterOptionsViewController *filterOptionsViewController =
        segue.destinationViewController;
    filterOptionsViewController.delegate = self;
  } else if ([segue.identifier isEqualToString:@"Share"]) {
    LPShareViewController *shareViewController =
        segue.destinationViewController;

    if (_filteredImage) {
      [shareViewController setPreviewImage:_filteredImage];
    } else {
      [shareViewController setPreviewImage:_image];
    }
  }
}

@end
