//
//  PieChartViewController.h
//  PieChart
//
//  Created by Simon Withington on 11/01/2012.
//  Copyright 2012 Scott Logic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "FeaturedPieChartDataSource.h"

@interface FeaturedPieChartViewController : UIViewController<SChartDelegate> {
  ShinobiChart *pieChart;

  // The datasource for the chart
  FeaturedPieChartDataSource *pieDatasource;

  // A dictionary to store the display data
  OrderedDictionary *dataDictionary;
}

@end
