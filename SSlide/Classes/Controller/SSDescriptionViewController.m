//
//  SSDescriptionViewController.m
//  SSlide
//
//  Created by techcamp on 2013/08/29.
//  Copyright (c) 2013年 S2. All rights reserved.
//

#import "SSDescriptionViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SSDescriptionViewController ()

@end

@implementation SSDescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    float leftMargin = self.view.bounds.size.width / 14;
    float topMargin = self.view.bounds.size.height / 24;
    float width = self.view.bounds.size.width - 2*leftMargin;
    float height = self.view.bounds.size.height - 2*topMargin;
    self.view.frame = CGRectMake(leftMargin, topMargin, width, height);
    
    UIImageView *description = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    [description setImage:[UIImage imageNamed:@"description.png"]];
    description.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:description];
    self.view.layer.cornerRadius = IS_IPAD ? 8.0 : 4.0;
    self.view.layer.masksToBounds = YES;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end