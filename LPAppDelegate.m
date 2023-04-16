//
//  LPAppDelegate.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPAppDelegate.h"
#import "HockeySDK.h"

@implementation LPAppDelegate {
  LPSessionController *_sessionController;
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [self setupHockeyAppWithIdentifier:@""];
  [self backgroundLogin];
  return YES;
}

- (void)setupHockeyAppWithIdentifier:(NSString *)identifier {
  [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:identifier];
  [[BITHockeyManager sharedHockeyManager] startManager];
  [[BITHockeyManager sharedHockeyManager]
          .authenticator authenticateInstallation];
}

- (void)backgroundLogin {
  _sessionController = [LPSessionController sharedInstance];
  [_sessionController setDelegate:self];
  [_sessionController backgroundLogin];
}

- (void)sessionDidLogin {
  self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                       bundle:nil];
  UIViewController *viewController = [storyboard
      instantiateViewControllerWithIdentifier:@"HomeNavigationViewController"];
  [self redirectToViewController:viewController];
}

- (void)redirectToViewController:(UIViewController *)viewController {
  CATransition *animation = [CATransition animation];
  [animation setDelegate:self];
  [animation setType:kCATransitionFade];
  [animation setDuration:0.4];
  [animation setTimingFunction:
                 [CAMediaTimingFunction
                     functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  [[self.window layer] addAnimation:animation
                             forKey:@"transitionViewAnimation"];

  self.window.rootViewController = viewController;
  [self.window makeKeyAndVisible];
}

@end
