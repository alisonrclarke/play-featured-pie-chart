//
//  PieChartDataSource.h
//  PieChart
//
//  Copyright 2012 Scott Logic Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ShinobiCharts/ShinobiChart.h>
#import "OrderedDictionary.h"

@interface FeaturedPieChartDataSource : NSObject <SChartDatasource>

@property (nonatomic, strong) OrderedDictionary *dataDictionary;
@property (nonatomic, strong) SChartPieSeries *pieSeries;

- (id)initWithData:(OrderedDictionary*)data;

@end
