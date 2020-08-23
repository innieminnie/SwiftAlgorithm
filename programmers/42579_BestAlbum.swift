//
//  42579_BestAlbum.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/02.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

func bestAlbum(_ genres:[String], _ plays:[Int]) -> [Int] {
    var totalRank=[String:Int]()
    
    for genreIdx in 0..<genres.count{
        var genre=genres[genreIdx]
        totalRank[genre]=(totalRank[genre] ?? 0)+plays[genreIdx]
    }
    
    let rank=totalRank.sorted(by:{$0.value>$1.value})
    
    var result=[Int]()
    
    for genre in rank{
        
        var firstMax=0
        var secondMax=0
        
        var firstMaxIdx=0
        var secondMaxIdx=0
        
        for i in 0..<genres.count{
            if genres[i] == genre.key {
                if plays[i]>firstMax{
                    secondMax=firstMax
                    secondMaxIdx=firstMaxIdx
                    
                    firstMax=plays[i]
                    firstMaxIdx=i
                }else if plays[i]>secondMax{
                    secondMax=plays[i]
                    secondMaxIdx=i
                }
            }
        }
        result.append(firstMaxIdx)
        
        if secondMax>0{
            result.append(secondMaxIdx)
        }
    }
    
    return result
}

// 내가 헤멘 부분 :
//1) 20번째줄, let rank로 변수를 새로 생성안하면, totalRank의 상태는 일시적으로 정렬됐다가 다시 map의 성질에 의해 순서가 random하게 바뀐다 (정렬이 안되는 경우가 생긴다.
//2) 문제의 세번째조건, 같은 값일 경우 고유순서가 낮은 것이 들어가야한다.34번줄 if 문의 조건에 동등부호가 들어가면 높은 것이 들어가버림

//다른사람의 풀이와 비교해보기
func solutionBestAlbum(_ genres:[String], _ plays:[Int])->[Int]{
    var playList=[String:(play:Int,music: [Int:Int])]()
    var answer=[Int]()
    
    for (index,value) in genres.enumerated(){// enumerated 매우 유용!!
        if let genre=playList[value]?.play{
            playList[value]?.play=genre+plays[index]
            playList[value]?.music[index]=plays[index]
        }else{
            playList[value]=(play: plays[index],music: [index:plays[index]])
        }
    }
    
    let rank = playList.sorted(by: { $0.value.play > $1.value.play })
    
    rank.forEach { song in
        let songRank = song.value.music.sorted { $0.value > $01.value }

        let max = songRank.count > 1 ? 2 : 1
        for i in 0..<max {
            answer.append(songRank[i].key)
        }
    }
    
    return answer
}


extension SolutionTests{
    func testbestAlbum_case1(){
        let genres=["classic","pop","classic","classic","pop"]
        let plays=[500, 600, 150, 800, 2500]
        let expected=[4, 1, 3, 0]

        let actual=bestAlbum(genres, plays)

        XCTAssertEqual(expected, actual)
    }
}
