//
//  ChartTouchUtilities.m
//  ShinobiControls
//
//  Created by Sam Davies on 08/06/2012.
//  Copyright (c) 2012 Scott Logic. All rights reserved.
//

#import "FeaturedPieChartUtilities.h"
#import <ShinobiCharts/ShinobiChart.h>

@implementation FeaturedPieChartUtilities

+ (NSMutableArray *)colourArray
{
  SChartTheme *theme = [SChartiOS7Theme new];
  return [[NSMutableArray alloc] initWithObjects:
          theme.blueColorLight,
          theme.orangeColorLight,
          theme.purpleColorLight,
          theme.redColorLight,
          theme.greenColorLight,
          nil];
}

@end
