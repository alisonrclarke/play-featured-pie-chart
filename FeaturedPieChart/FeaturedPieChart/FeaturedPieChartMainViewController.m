//
//  SPViewController.m
//  FeaturedPieChart
//
//  Created by Alison Clarke on 23/06/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "FeaturedPieChartMainViewController.h"
#import "FeaturedPieChartViewController.h"

@interface FeaturedPieChartMainViewController ()

@property (strong, nonatomic) UIViewController *chartViewController;

@end

@implementation FeaturedPieChartMainViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
	self.chartViewController = [[FeaturedPieChartViewController alloc] init];
  [self.view addSubview:self.chartViewController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
