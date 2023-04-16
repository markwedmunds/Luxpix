//
//  LPAppDelegate.h
//  LuxPix
//
//  Created by Mark Edmunds on 24/05/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPSessionController.h"

@interface LPAppDelegate : UIResponder <UIApplicationDelegate, LPSessionControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)redirectToViewController:(UIViewController *)viewController;

@end
