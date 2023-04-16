//
//  LPCustomTextView.h
//  LuxPix
//
//  Created by Mark Edmunds on 15/08/2014.
//  Copyright (c) 2014 Hybrid Designs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPCustomTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

- (void)textChanged:(NSNotification *)notification;

@end
