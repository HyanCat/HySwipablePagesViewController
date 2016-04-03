//
//  HySwipablePagesViewController.h
//
//  Created by HyanCat on 16/4/3.
//  Copyright © 2016年 hyancat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HySwipablePagesViewController;
@protocol HySwipablePagesViewControllerDelegate <NSObject>
@optional

- (void)hySwipablePagesViewController:(HySwipablePagesViewController *)swipableController willSwipeToControlller:(UIViewController *)controller;
- (void)hySwipablePagesViewController:(HySwipablePagesViewController *)swipableController didSwipeToControlller:(UIViewController *)controller;

- (void)hySwipablePagesViewController:(HySwipablePagesViewController *)swipableController didSwipeWithPosition:(CGFloat)position;

@end

@interface HySwipablePagesViewController : UIViewController

@property (nonatomic, weak, readonly) UIScrollView *scrollView;
@property (nonatomic, assign, readonly) NSUInteger currentPage;

@property (nonatomic, weak) id <HySwipablePagesViewControllerDelegate> delegate;

- (instancetype)initWithViewControllers:(NSArray <UIViewController *> *)viewControllers;

- (void)swipeToPage:(NSUInteger)page animated:(BOOL)animated;

@end
