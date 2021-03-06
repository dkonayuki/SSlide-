//
//  SSUserView.h
//  SSlide
//
//  Created by iNghia on 8/21/13.
//  Copyright (c) 2013 S2. All rights reserved.
//

#import "SSView.h"
#import "SSSlideListView.h"

@protocol SSUserViewDelegate <SSViewDelegate>

- (void)segmentedControlChangedDel:(NSUInteger)index;
- (NSString *)getUsernameDel;
- (void)deleteDownloadedSlideAtIndex:(NSUInteger)index;

@end

@interface SSUserView : SSView

@property (strong, nonatomic) SSSlideListView *slideListView;

- (void)refresh;

@end
