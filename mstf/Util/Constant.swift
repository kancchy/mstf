//
//  Constant.swift
//  mstf
//
//  Created by 山口賢明 on 2021/03/10.
//

import Foundation

enum PointPattern {
    case doubleFault, out, ace, notUp, net
}

enum Point :String{
    case zero = "0"
    case fifteen = "15"
    case thirty = "30"
    case forty = "40"
    case Deuce
    case Advantage = "A"
    
    static func findPoint(_ point:Int) -> Point{
        if(point == 0){
            return Point.zero
        }else if(point == 1){
            return Point.fifteen
        }else if point == 2{
            return Point.thirty
        }else if point == 3{
            return Point.forty
        }
        return Point.forty
    }
}
