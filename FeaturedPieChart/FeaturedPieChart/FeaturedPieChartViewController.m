//
//  PieChartViewController.m
//  PieChart
//
//  Copyright 2012 Scott Logic Ltd. All rights reserved.

#import "FeaturedPieChartViewController.h"
#import <ShinobiCharts/ShinobiChart.h>
//#import "GAIDictionaryBuilder.h"

@implementation FeaturedPieChartViewController

#pragma mark - View lifecycle
- (void)addPieChart
{
  // Initialise the data source we will use for the charts
  pieDatasource = [[FeaturedPieChartDataSource alloc] initWithData:dataDictionary];

  // Create the pie chart
  pieChart = [[ShinobiChart alloc] initWithFrame:CGRectMake(50, 20, self.view.bounds.size.width - 100, self.view.bounds.size.height - 70)];
  pieChart.title = @"Names for pet turtles after 1984";
  pieChart.titlePosition = SChartTitlePositionTopOrRight;
  pieChart.datasource = pieDatasource;
  pieChart.legend.hidden = NO;
  pieChart.legend.placement = SChartLegendPlacementInsidePlotArea;
  
  [self.view addSubview:pieChart];
}


- (void)createChart {
  // Prepare the data dictionary
  [self generateData];

  [self addPieChart];

  pieChart.delegate = self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [SChartiOS7Theme new].chartStyle.backgroundColor;
  [self createChart];
}

- (void)viewDidUnload
{
  // Set them to nil so as not to upset dealloc
  pieChart = nil;
  pieDatasource = nil;
  dataDictionary = nil;

  [super viewDidUnload];
}

- (void)generateData
{
  dataDictionary = [[OrderedDictionary alloc] init];

  [dataDictionary setObject:[NSNumber numberWithInt:28] forKey:@"Leonardo"];
  [dataDictionary setObject:[NSNumber numberWithInt:23] forKey:@"Michelangelo"];
  [dataDictionary setObject:[NSNumber numberWithInt:21] forKey:@"Donatello"];
  [dataDictionary setObject:[NSNumber numberWithInt:16] forKey:@"Raphael"];
  [dataDictionary setObject:[NSNumber numberWithInt:12] forKey:@"Other"];
}

-(void)sChart:(ShinobiChart *)chart toggledSelectionForRadialPoint:(SChartRadialDataPoint *)dataPoint inSeries:(SChartRadialSeries *)series atPixelCoordinate:(CGPoint)pixelPoint
{
  // Send event to GA
  /*[[[GAI sharedInstance] defaultTracker] send:[[GAIDictionaryBuilder createEventWithCategory:@"interaction"
                                                action:@"chart_interaction"
                                                label:@"Featured pie chart"
                                                value:nil] build]];*/
}

@end
