//
//  SSSlideShowViewController.h
//  SSlide
//
//  Created by iNghia on 8/22/13.
//  Copyright (c) 2013 S2. All rights reserved.
//

#import "SSViewController.h"
#import "SSSlideshow.h"

@protocol SSSlideShowViewControllerDelegate <NSObject>

- (void)closePopup;
- (void)showControlView;
- (void)hideControlView;
- (void)toogleInfoView;
- (void)setImageSize:(CGSize)size;
- (void)sendQuestion:(NSString *)question;
- (BOOL)isStreamingAsClient;

@end

@interface SSSlideShowViewController : SSViewController

@property (assign, nonatomic) NSInteger pageIndex;
@property (weak, nonatomic) id delegate;

- (id)initWithCurrentSlideshow:(SSSlideshow *)currentSlide pageIndex:(NSInteger)index andDelegate:(id)delegate;

@end
