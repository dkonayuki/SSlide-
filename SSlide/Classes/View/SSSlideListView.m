//
//  SSSlideListView.m
//  SSlide
//
//  Created by techcamp on 2013/08/23.
//  Copyright (c) 2013年 S2. All rights reserved.
//

#import "SSSlideListView.h"
#import "SSSlideCell.h"

@interface SSSlideListView() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SSSlideListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (void) initView
{
    self.slideTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                        0,
                                                                        self.bounds.size.width,
                                                                        self.bounds.size.height
                                                                        )];
    self.slideTableView.delegate = self;
    self.slideTableView.dataSource = self;
    self.slideTableView.backgroundColor = [UIColor clearColor];
    self.slideTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.slideTableView];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.delegate numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"SlideCell";
    SSSlideCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SSSlideCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    SSSlideshow *data = [self.delegate getDataAtIndex:indexPath.row];
    [cell setData:data];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (IS_IPAD)
    {
        return [[SSDB5 theme] floatForKey:@"slide_cell_height_ipad"];
    }
    return [[SSDB5 theme] floatForKey:@"slide_cell_height_iphone"];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSInteger currentOffset = scrollView.contentOffset.y;
    NSInteger maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
    NSInteger diffOffset = 400;
    if (IS_IPAD)
    {
        diffOffset *= 2.2;
    }
    
    if (maximumOffset - currentOffset <= diffOffset)
    {
        [self.delegate getMoreSlides];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate didSelectedAtIndex:indexPath.row];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
