//
//  FirstViewController.m
//  HySwipablePagesViewControllerDemo
//
//  Created by HyanCat on 16/4/3.
//  Copyright © 2016年 hyancat. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *kFirstTableViewCellIdentifier = @"firstTableViewCellIdentifier";

@implementation FirstViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.title = @"first";
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kFirstTableViewCellIdentifier];
//	UIEdgeInsets edge = UIEdgeInsetsMake(self.navigationController.navigationBar.frame.size.height+20, 0, 0, 0);
//	self.tableView.contentInset = edge;
//	self.tableView.scrollIndicatorInsets = edge;
//	self.navigationController.navigationBarHidden = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 44.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFirstTableViewCellIdentifier forIndexPath:indexPath];
	cell.textLabel.text = @(indexPath.row).stringValue;
	return cell;
}


@end
