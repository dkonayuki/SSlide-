//
//  SSSlideShowView.h
//  SSlide
//
//  Created by iNghia on 8/22/13.
//  Copyright (c) 2013 S2. All rights reserved.
//

#import "SSView.h"

@protocol SSSlideShowViewDelegate <SSViewDelegate>

- (void)dismissView;
- (void)createQuestion:(NSString *)question;
- (void)swipeLeftAction;
- (void)tapAction;
- (void)swipeRightAction;
- (BOOL)isStreamingAsClient;

@end

@interface SSSlideShowView : SSView

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIActivityIndicatorView *loadingSpinner;

@end
