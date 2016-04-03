//
//  HySwipablePagesViewController.m
//
//  Created by HyanCat on 16/4/3.
//  Copyright © 2016年 hyancat. All rights reserved.
//

#import "HySwipablePagesViewController.h"
#import "UIView+HySwipablePagesViewController.h"

@interface HySwipablePagesViewController () <UIScrollViewDelegate>

@property (nonatomic, weak, readwrite) UIScrollView *scrollView;
@property (nonatomic, assign, readwrite) NSUInteger currentPage;

@property (nonatomic, copy) NSArray <UIViewController *> *viewControllers;

@end

@implementation HySwipablePagesViewController

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (instancetype)initWithViewControllers:(NSArray <UIViewController *> *)viewControllers;
{
	self = [super init];
	if (self) {
		_viewControllers = viewControllers;
		_currentPage = 0;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor redColor];
	
	UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.pagingEnabled = YES;
	scrollView.bounces = NO;
	scrollView.delegate = self;
	scrollView.backgroundColor = [UIColor blueColor];
	
	[self.view hs_addSubviewToFill:scrollView];
	self.scrollView = scrollView;

	self.edgesForExtendedLayout = UIRectEdgeNone;
	
	[self _loadSubviewControllers];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientationDidChange:(NSNotification *)notification
{
	[self _updateSubviewController];
}

- (void)swipeToPage:(NSUInteger)page animated:(BOOL)animated
{
	[self.scrollView setContentOffset:CGPointMake(self.view.hs_width*page, 0) animated:animated];
}

#pragma mark - Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	CGFloat position = scrollView.contentOffset.x / self.view.hs_width;
	if (self.delegate && [self.delegate respondsToSelector:@selector(hySwipablePagesViewController:didSwipeWithPosition:)]) {
		[self.delegate hySwipablePagesViewController:self didSwipeWithPosition:position];
	}
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
	NSUInteger willStopPage = ceil(targetContentOffset->x / self.view.hs_width);
	if (self.delegate && [self.delegate respondsToSelector:@selector(hySwipablePagesViewController:willSwipeToControlller:)]) {
		[self.delegate hySwipablePagesViewController:self willSwipeToControlller:self.viewControllers[willStopPage]];
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	self.currentPage = ceil(self.scrollView.contentOffset.x / self.view.hs_width);
	if (self.delegate && [self.delegate respondsToSelector:@selector(hySwipablePagesViewController:didSwipeToControlller:)]) {
		[self.delegate hySwipablePagesViewController:self didSwipeToControlller:self.viewControllers[self.currentPage]];
	}
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
	self.currentPage = ceil(self.scrollView.contentOffset.x / self.view.hs_width);
	if (self.delegate && [self.delegate respondsToSelector:@selector(hySwipablePagesViewController:didSwipeToControlller:)]) {
		[self.delegate hySwipablePagesViewController:self didSwipeToControlller:self.viewControllers[self.currentPage]];
	}
}

- (void)_loadSubviewControllers
{
	[self.viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull controller, NSUInteger idx, BOOL * _Nonnull stop) {
		[self addChildViewController:controller];
		[self.scrollView addSubview:controller.view];
	}];
	
	[self _updateSubviewController];
}

- (void)_updateSubviewController
{
	CGFloat viewWidth = self.view.hs_width;
	CGFloat viewHeight = self.view.hs_height;
	[self.viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull controller, NSUInteger idx, BOOL * _Nonnull stop) {
		controller.view.hs_width = viewWidth;
		controller.view.hs_height = viewHeight;
		controller.view.hs_x = idx * viewWidth;
	}];
	self.scrollView.contentSize = CGSizeMake(viewWidth * self.viewControllers.count, viewHeight);
	[self.scrollView setContentOffset:CGPointMake(viewWidth*self.currentPage, 0) animated:NO];
}

@end
