//
//  LPShareViewController.m
//  LuxPix
//
//  Created by Mark Edmunds.
//  Copyright (c) 2023 Hybrid Designs. All rights reserved.
//

#import "LPShareViewController.h"
#import <Social/Social.h>

static NSString *const kTwitterButton = @"twitterButton";
static NSString *const kFacebookButton = @"facebookButton";
static NSString *const kInstagramButton = @"instagramButton";
static NSString *const kWeiboButton = @"weiboButton";

@implementation LPShareViewController {
  UIImage *_image;
  NSDictionary *_shareButtons;
  LPSessionController *_sessionController;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  if (_image) {
    [_imagePreview setImage:_image];
  }

  _shareButtons = @{
    kTwitterButton : _twitterButton,
    kFacebookButton : _facebookButton,
    kInstagramButton : _instagramButton,
    kWeiboButton : _weiboButton
  };

  _sessionController = [LPSessionController sharedInstance];
  [_sessionController setDelegate:self];

  [_commentTextView setPlaceholder:@"Add a comment..."];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [[event allTouches] anyObject];
  if ([_commentTextView isFirstResponder] && [touch view] != _commentTextView) {
    [_commentTextView resignFirstResponder];
  }
  [super touchesBegan:touches withEvent:event];
}

- (void)setPreviewImage:(UIImage *)image {
  _image = [UIImage imageWithCIImage:image.CIImage
                               scale:1.0
                         orientation:UIImageOrientationRight];
}

- (void)styleNormal:(UIButton *)button {
  [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
  [button setBackgroundColor:[UIColor clearColor]];
}

- (void)styleSelected:(UIButton *)button {
  [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
  [button setBackgroundColor:[UIColor lightGrayColor]];
}

- (void)toggleButton:(UIButton *)button {
  [button setSelected:!button.selected];

  if (button.selected) {
    [self styleSelected:button];
  } else {
    [self styleNormal:button];
  }
}

- (BOOL)userHasAccessToTwitter {
  return
      [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
}

- (BOOL)userHasAccessToFacebook {
  return
      [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
}

- (BOOL)userHasAccessToSinaWeibo {
  return [SLComposeViewController
      isAvailableForServiceType:SLServiceTypeSinaWeibo];
}

- (IBAction)shareTwitter:(id)sender {
  if ([self userHasAccessToTwitter]) {
    [self toggleButton:_twitterButton];
  } else {
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:@"Twitter Fail"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
  }
}

- (IBAction)shareFacebook:(id)sender {
  if ([self userHasAccessToFacebook]) {
    [self toggleButton:_facebookButton];
  } else {
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:@"Facebook Fail"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
  }
}

- (IBAction)shareInstagram:(id)sender {
  [self toggleButton:_instagramButton];
}

- (IBAction)shareWeibo:(id)sender {
  if ([self userHasAccessToSinaWeibo]) {
    [self toggleButton:_weiboButton];
  } else {
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:@"Weibo Fail"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
  }
}

- (IBAction)share:(id)sender {
  for (id key in _shareButtons) {
    id shareButton = _shareButtons[key];
    if (shareButton && [shareButton isKindOfClass:[UIButton class]]) {
      UIButton *button = (UIButton *)shareButton;

      if (button.selected) {
        if (key == kTwitterButton) {
          NSLog(@"Twitter!");
          // TODO: Make share class
          // LPShare *share = [[LPShare alloc]
          // initWithFramework:LPShareFrameworkTwitter]; [share
          // shareContent:@"some text"];
        } else if (key == kFacebookButton) {
          NSLog(@"Facebook!");
        } else if (key == kInstagramButton) {
          NSLog(@"Instagram!");
        } else if (key == kWeiboButton) {
          NSLog(@"Weibo!");
        }
      }
    }
  }

  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
