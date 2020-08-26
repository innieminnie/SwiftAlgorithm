//
//  10870_Fibonacci.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/26.
//  Copyright © 2020 innie. All rights reserved.

//  Recursion

import Foundation

class Fibonacci5{
    
    func getInput()->Int{
        let num=Int(readLine()!)!
        return num
    }
    
    func fibonacci(_ n : Int)->Int{
        if n == 0{
            return 0
        }else if n == 1 {
            return 1
        }else{
            return fibonacci(n-1)+fibonacci(n-2)
        }
    }
}

//var fib5=Fibonacci()
//let num = fib5.getInput()
//print(fib5.fibonacci(num))
