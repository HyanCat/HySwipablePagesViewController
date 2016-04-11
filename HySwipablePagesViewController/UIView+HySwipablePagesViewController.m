//
//  UIView+HySwipablePagesViewController.m
//  HySwipablePagesViewControllerDemo
//
//  Created by HyanCat on 16/4/3.
//  Copyright © 2016年 hyancat. All rights reserved.
//

#import "UIView+HySwipablePagesViewController.h"

@implementation UIView (HySwipablePagesViewController)

@dynamic hs_x, hs_y, hs_width, hs_height, hs_origin, hs_size;

- (CGFloat)hs_x
{
	return self.frame.origin.x;
}

- (CGFloat)hs_y
{
	return self.frame.origin.y;
}

- (CGFloat)hs_width
{
	return self.frame.size.width;
}

- (CGFloat)hs_height
{
	return self.frame.size.height;
}

- (CGPoint)hs_origin
{
	return self.frame.origin;
}

- (CGSize)hs_size
{
	return self.frame.size;
}

- (void)setHs_x:(CGFloat)hs_x
{
	CGRect frame = self.frame;
	frame.origin.x = hs_x;
	self.frame = frame;
}

- (void)setHs_y:(CGFloat)hs_y
{
	CGRect frame = self.frame;
	frame.origin.y = hs_y;
	self.frame = frame;
}

- (void)setHs_width:(CGFloat)hs_width
{
	CGRect frame = self.frame;
	frame.size.width = hs_width;
	self.frame = frame;
}

- (void)setHs_height:(CGFloat)hs_height
{
	CGRect frame = self.frame;
	frame.size.height = hs_height;
	self.frame = frame;
}

- (void)setHs_origin:(CGPoint)hs_origin
{
	CGRect frame = self.frame;
	frame.origin = hs_origin;
	self.frame = frame;
}

- (void)setHs_size:(CGSize)hs_size
{
	CGRect frame = self.frame;
	frame.size = hs_size;
	self.frame = frame;
}

- (void)hs_addSubviewToFill:(UIView *)view
{
	if (view.superview) {
		[view removeFromSuperview];
	}
    view.frame = self.bounds;
	[self addSubview:view];
	view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

@end
