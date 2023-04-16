//
//  LPUserDetailViewController.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPUserDetailViewController.h"
#import "LPAppDelegate.h"
#import "LPFacebookSessionService.h"
#import "LPStartViewController.h"

@implementation LPUserDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section == 0) {
    LPSessionController *sessionController =
        [LPSessionController sharedInstance];
    [sessionController setDelegate:self];
    [sessionController logout];
  }
}

- (void)sessionDidLogout {
  LPAppDelegate *delegate =
      (LPAppDelegate *)[UIApplication sharedApplication].delegate;
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                       bundle:nil];
  UIViewController *viewController =
      [storyboard instantiateInitialViewController];
  [delegate redirectToViewController:viewController];
}

@end
