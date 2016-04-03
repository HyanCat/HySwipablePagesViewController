//
//  UIView+HySwipablePagesViewController.h
//  HySwipablePagesViewControllerDemo
//
//  Created by HyanCat on 16/4/3.
//  Copyright © 2016年 hyancat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HySwipablePagesViewController)

@property (nonatomic, assign) CGFloat hs_x;
@property (nonatomic, assign) CGFloat hs_y;
@property (nonatomic, assign) CGFloat hs_width;
@property (nonatomic, assign) CGFloat hs_height;

@property (nonatomic, assign) CGPoint hs_origin;
@property (nonatomic, assign) CGSize hs_size;

- (void)hs_addSubviewToFill:(UIView *)view;

@end
