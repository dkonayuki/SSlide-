//
//  SSAppDelegate.h
//  SSlide
//
//  Created by iNghia on 8/21/13.
//  Copyright (c) 2013 S2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSPageViewManager.h"

@interface SSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SSPageViewManager *pageViewManager;

@end
