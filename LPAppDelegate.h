//
//  LPAppDelegate.h
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import "LPSessionController.h"
#import <UIKit/UIKit.h>

@interface LPAppDelegate
    : UIResponder <UIApplicationDelegate, LPSessionControllerDelegate>

@property(strong, nonatomic) UIWindow *window;

- (void)redirectToViewController:(UIViewController *)viewController;

@end
