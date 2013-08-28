//
//  SSTopViewController.m
//  SSlide
//
//  Created by iNghia on 8/21/13.
//  Copyright (c) 2013 S2. All rights reserved.
//

#import "SSTopViewController.h"
#import "SSTopView.h"
#import "SSApi.h"
#import "SSSlideshow.h"
#import "SSSlideShowPageViewController.h"
#import <UIViewController+MJPopupViewController.h>

@interface SSTopViewController () <SSSlideListViewDelegate, SSSlideShowPageViewControllerDelegate>

@property (strong, nonatomic) SSTopView *myView;
@property (strong, nonatomic) NSMutableArray *slideArray;
@property (assign, nonatomic) NSInteger currentPage;

@property (strong, nonatomic) SSSlideShowPageViewController *pageViewController;

@end

@implementation SSTopViewController

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
	// Do any additional setup after loading the view.
    self.currentPage = 1;
    self.myView = [[SSTopView alloc] initWithFrame:self.view.bounds andDelegate:self];
    self.view = self.myView;
    // init slideArray
    self.slideArray = [[NSMutableArray alloc] init];
    // show loading
    [SVProgressHUD showWithStatus:@"Loading"];
    // get first slide
    [self getTopSlideshows];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SSTopView delegate
- (NSInteger)numberOfRows
{
    return self.slideArray.count;
}

- (SSSlideshow *)getDataAtIndex:(int)index
{
    return [self.slideArray objectAtIndex:index];
}

- (void)getMoreSlides
{
    self.currentPage ++;
    [self getTopSlideshows];
}

- (void)didSelectedAtIndex:(int)index
{
    SSSlideshow *selectedSlide = [self.slideArray objectAtIndex:index];
    self.pageViewController = [[SSSlideShowPageViewController alloc] initWithSlideshow:selectedSlide andDelegate:self];
    [self presentPopupViewController:self.pageViewController animationType:MJPopupViewAnimationFade];
}

- (void) reloadSlidesListDel
{
    [self.myView.slideListView.slideTableView reloadData];
}

- (void)closePopupDel
{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
}

#pragma mark - private
- (void)getTopSlideshows
{
    // TODO: get setting info
    [[SSApi sharedInstance] getMostViewedSlideshows:@"Ruby"
                                               page:self.currentPage
                                       itemsPerPage:[[SSDB5 theme] integerForKey:@"slide_num_in_page"]
                                            success:^(NSArray *result){
                                                // stop loading status
                                                [SVProgressHUD dismiss];
                                                [self.slideArray addObjectsFromArray:result];
                                                [self.myView.slideListView.slideTableView reloadData];
                                            }
                                            failure:^(void) {     // TODO: error handling
                                                [SVProgressHUD dismiss];
                                                NSLog(@"MostViewed ERROR");
                                            }];
}

@end
