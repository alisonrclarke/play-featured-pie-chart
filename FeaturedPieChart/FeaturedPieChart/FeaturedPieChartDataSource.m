//
//  PieChartDataSource.m
//  PieChart
//
//  Copyright 2012 Scott Logic Ltd. All rights reserved.
//

#import "FeaturedPieChartDataSource.h"
#import "FeaturedPieChartUtilities.h"

@implementation FeaturedPieChartDataSource

@synthesize pieSeries = _pieSeries;

#pragma mark - Initialisation
-(id)initWithData:(OrderedDictionary *)data {
  self = [super init];
  if(self) {
    self.dataDictionary = data;

    [self generateSeries];
  }
  return self;
}


#pragma mark -
#pragma mark Datasource Protocol Functions

// Returns the number of points for a specific series in the specified chart
- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(NSInteger)seriesIndex {
  //In our example, all series have the same number of points
  return [self.dataDictionary count];
}

// Returns the series at the specified index for a given chart
-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index {
  return self.pieSeries;
}

// Returns the number of series in the specified chart
- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart {
  return 1;
}

// Returns the data point at the specified index for the given series/chart.
- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex {
  SChartRadialDataPoint *datapoint = [[SChartRadialDataPoint alloc] init];
  NSString* key = self.dataDictionary.allKeys[dataIndex];
  datapoint.name = key;
  datapoint.value = self.dataDictionary[key];
  return datapoint;
}

- (void)generateSeries
{
  // Pie Chart
  self.pieSeries = [[SChartPieSeries alloc] init];

  // Configure the series
  self.pieSeries.labelFormatString = @"%.0f%%";

  // When a slice of the pie is selected, it rotates to the top of the chart
  self.pieSeries.selectedPosition = [NSNumber numberWithInt:0];

  SChartAnimation *easeOutCurve = [SChartAnimation radialSelection];
  easeOutCurve.duration = @2.0f;
  self.pieSeries.selectionAnimation = easeOutCurve;

  // Set the protrusion level. This should be done inside the theme, but it doesn't
  // seem to work.
  // Set the amount that the selected pie slice protrudes
  self.pieSeries.style.protrusion = 0.f;
  self.pieSeries.selectedStyle.protrusion = 50.f;

  NSMutableArray *segmentColours = [FeaturedPieChartUtilities colourArray];
  self.pieSeries.style.flavourColors = segmentColours;
  self.pieSeries.selectedStyle.flavourColors = segmentColours;
}


@end

