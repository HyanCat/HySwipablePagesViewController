//
//  ViewController.m
//  HySwipablePagesViewControllerDemo
//
//  Created by HyanCat on 16/4/3.
//  Copyright © 2016年 hyancat. All rights reserved.
//

#import "ViewController.h"
#import "HySwipablePagesViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "UIView+HySwipablePagesViewController.h"

@interface ViewController ()

@property (nonatomic, strong) HySwipablePagesViewController *swipableController;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Main";
	
	self.automaticallyAdjustsScrollViewInsets = NO;
//	self.navigationController.navigationBarHidden = YES;
	
	FirstViewController *firstController = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:[NSBundle mainBundle]];
	SecondViewController *secondController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:[NSBundle mainBundle]];
	ThirdViewController *thirdController = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:[NSBundle mainBundle]];
	
	self.swipableController = [[HySwipablePagesViewController alloc] initWithViewControllers:@[firstController, secondController, thirdController]];
	
	[self addChildViewController:self.swipableController];
	[self.view hs_addSubviewToFill:self.swipableController.view];
	
}

@end
