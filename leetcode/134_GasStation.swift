//
//  134_GasStation.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/09.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class GasStation {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var totalProfit = 0
        var curProfit = 0
        let n = gas.count
        var startIdx = 0
        
        for i in 0..<n{
            let tank = gas[i]-cost[i]
            
            if tank > curProfit + tank{
                startIdx = i
                curProfit = tank
            }else{
                curProfit += tank
            }
            totalProfit+=tank
        }
        
        return totalProfit >= 0 ? startIdx : -1
    }
    
    func canCompleteCircuit_ver2(_ gas: [Int], _ cost: [Int]) -> Int {
        var stationCount = 0
        
        for i in 0..<gas.count{
            var currentGas = 0
            var currentStation = i
            var count = 0
            
            if gas[currentStation] >= cost[currentStation]{
                while(currentGas >= 0){
                    count+=1
                    currentGas += gas[currentStation]
                    currentGas -= cost[currentStation]
                    currentStation+=1
                    if currentStation == gas.count{
                        currentStation = 0
                    }
                    if count > gas.count{
                        return i
                    }
                }
            }
        }
        return -1
    }
}

extension SolutionTests{
    func testcanCompleteCircuit_case1(){
        let gas = [2,3,4]
        let cost = [3,4,3]
        
        let expected = -1
        
        let actual = GasStation().canCompleteCircuit(gas, cost)
        
        XCTAssertEqual(expected, actual)
    }
}
