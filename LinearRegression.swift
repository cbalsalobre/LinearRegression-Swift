//
//  LinearRegression.swift
//  LinearRegression
//
//  Created by Phillip Porch on 10/5/14.
//
//

import Foundation

struct regressionInput {
    var xValue: Double
    var yValue: Double
}

func linearRegression (array: [regressionInput]) -> (intercept: Double, slope: Double, correlation: Double)
{
    var intercept = 0.0
    var slope = 0.0
    var correlation = 0.0
    var sumX = 0.0
    var sumY = 0.0
    var sumXY = 0.0
    var sumX2 = 0.0
    var sumY2 = 0.0
    let numberOfItems = array.count
    
    for arrayItem in array as? [regressionInput]  {
        sumX += arrayItem.xValue
        sumY += arrayItem.yValue
        sumXY += (arrayItem.xValue * arrayItem.yValue)
        sumX2 += (arrayItem.xValue * arrayItem.xValue)
        sumY2 += (arrayItem.yValue * arrayItem.yValue)
    }
    slope = ((Double(numberOfItems) * sumXY) - (sumX * sumY)) / ((Double(numberOfItems) * sumX2) - (sumX * sumX))
    intercept = (sumY * sumX2 - (sumX * sumXY)) / ((Double(numberOfItems) * sumX2) - (sumX * sumX))
    correlation = ((Double(numberOfItems) * sumXY) - (sumX * sumY)) / (sqrt(Double(numberOfItems) * sumX2 - (sumX * sumX)) * sqrt(Double(numberOfItems) * sumY2 - (sumY * sumY)))
    return (intercept, slope, correlation)
}

//Insert following code where needed, for example inside viewDidLoad
        let pair1 = regressionInput(xValue: 0.84,yValue: 55.18)
        let pair2 = regressionInput(xValue: 0.71,yValue: 64.09)
        let pair3 = regressionInput(xValue: 0.62,yValue: 72.99)
        
        let finalArray: [regressionInput] = [pair1,pair2,pair3]
        
        linearRegression(finalArray)
        
        print(linearRegression(finalArray).intercept,linearRegression(finalArray).slope,linearRegression(finalArray).correlation)



