//
//  3190_Snake.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/26.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation

class Snake{
    
    var board=[[Int]]()
    var infoSet=[Int]()

    func initBoard(){
        let boardSize=Int(readLine()!)!
        
        board = Array(repeating:Array(repeating: 0, count: boardSize+2), count: boardSize+2)
        
        for i in 0..<boardSize+2{
            for j in 0..<boardSize+2{
                if i == 0 || j == 0 || i == boardSize+1 || j == boardSize+1 {
                    board[i][j] = -1
                }else{
                    board[i][j] = 0
                }
            }
        }
        
        let appleNum=Int(readLine()!)!
        
        for _ in 0..<appleNum{
            let applePoint=readLine()!.components(separatedBy: " ")
            board[Int(applePoint[0])!][Int(applePoint[1])!] = 1
        }
    }

    func setDirectionInfo(){
        let infoNum=Int(readLine()!)!
        
        for _ in 0..<infoNum{
            let dirInfo = readLine()!.components(separatedBy: " ")
            if dirInfo[1] == "D"{
                infoSet.append(Int(dirInfo[0])!)
            }else{
                infoSet.append(-Int(dirInfo[0])!)
            }
        }
    }


    func playDummyGame()->Int{
        
        let headDirectionX = [0, 1, 0, -1]
        let headDirectionY = [1, 0, -1, 0]
        
        var direction = 0
        var count = 1
        
        var currentX = 1
        var currentY = 1
        
        var head = 0
        
        
        var snake=[(Int,Int)]()
        snake.append((currentX,currentY))
        
        while( true ){
            
            currentX=currentX+headDirectionX[direction]
            currentY=currentY+headDirectionY[direction]
            
            head = board[currentX][currentY]
            
            switch head{
            case -1:
                return count
            case 0:
                snake.insert((currentX,currentY), at: 0)
                let tail = snake.removeLast()
                
                board[currentX][currentY] = -1
                board[tail.0][tail.1] = 0
                
            case 1:
                snake.insert((currentX,currentY), at: 0)
                board[currentX][currentY] = -1
                
            default: break
                
            }
            
            if !infoSet.isEmpty, count == abs(infoSet.first!){
                if infoSet.first! > 0 {
                    direction = direction < 3 ? direction + 1 : 0
                }else {
                     direction = direction > 0 ? direction - 1 : 3
                }
                infoSet.removeFirst()
            }
            
            count+=1
        }

        return count
    }
}

//var snake=Snake()
//snake.initBoard()
//snake.setDirectionInfo()
//print(snake.playDummyGame())
