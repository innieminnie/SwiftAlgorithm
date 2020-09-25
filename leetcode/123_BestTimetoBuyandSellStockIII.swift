//
//  123_BestTimetoBuyandSellStockIII.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/17.
//  Copyright © 2020 innie. All rights reserved.
//
import Foundation
import XCTest

class BestTimetoBuyandSellStockIII{
  func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count>0 else{
            return 0
        }
        
        var maxProfit=0
        var finalMaxProfit=0
        var maxProfitLeft=[Int]()
        
        var low=prices.first!
        var high=prices.last!
        
        for price in prices{
            maxProfit=max(price-low,maxProfit)
            low=min(price,low)
            maxProfitLeft.append(maxProfit)
        }
    
        maxProfit=0
        
        for i in (0..<prices.count).reversed(){
            let price=prices[i]
            maxProfit=max(high-price,maxProfit)
            high=max(price,high)
            finalMaxProfit=max(finalMaxProfit,maxProfit+maxProfitLeft[i])
        }
        return finalMaxProfit
        
    }
}
extension SolutionTests{
    func testmaxProfit_case1(){
        let prices = [3,3,5,0,0,3,1,4]
        let expected = 6
        
        let actual = BestTimetoBuyandSellStockIII().maxProfit(prices)
        
        XCTAssertEqual(expected,actual)
    }
    func testmaxProfit_case2(){
        let prices = [1,2,3,4,5]
        let expected = 4
        
        let actual = BestTimetoBuyandSellStockIII().maxProfit(prices)
        
        XCTAssertEqual(expected,actual)
    }
    func testmaxProfit_case3(){
        let prices = [7,6,4,3,1]
        let expected = 0
        
        let actual = BestTimetoBuyandSellStockIII().maxProfit(prices)
        
        XCTAssertEqual(expected,actual)
    }
    func testmaxProfit_case4(){
        let prices = [1]
        let expected = 0
        
        let actual = BestTimetoBuyandSellStockIII().maxProfit(prices)
        
        XCTAssertEqual(expected,actual)
    }
    func testmaxProfit_case5(){
        let prices = [3,2,6,5,0,3]
        let expected = 7
        
        let actual = BestTimetoBuyandSellStockIII().maxProfit(prices)
        
        XCTAssertEqual(expected, actual)
        
    }
}
