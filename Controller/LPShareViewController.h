//
//  LPShareViewController.h
//  LuxPix
//
//  Created by Mark Edmunds on 16/07/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPSessionController.h"
#import "LPCustomTextView.h"

@interface LPShareViewController : UIViewController <LPSessionControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagePreview;
@property (weak, nonatomic) IBOutlet LPCustomTextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *instagramButton;
@property (weak, nonatomic) IBOutlet UIButton *weiboButton;

- (IBAction)shareTwitter:(id)sender;
- (IBAction)shareFacebook:(id)sender;
- (IBAction)shareInstagram:(id)sender;
- (IBAction)shareWeibo:(id)sender;

- (IBAction)share:(id)sender;

- (void)setPreviewImage:(UIImage *)image;

@end
