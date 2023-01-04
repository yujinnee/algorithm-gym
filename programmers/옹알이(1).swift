//
//  main.swift
//  Algorithm
//
//  Created by 이유진 on 2022/05/07.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    var babbling = babbling
    var answer = 0
    var possibleCount = 0
    for i in 0 ..< babbling.count{
        var word = babbling[i]
        if word.count == 2{
            if word == "ye" || word == "ma"{
                answer = answer + 1
            }
        }else if word.count == 3{
            if word == "aya" || word == "woo"{
                answer = answer + 1
            }
        }else if word.count > 3{
            for j in 0..<word.count-1{
                switch word[j]{
                case "a":
                    if word[j+1] == "y"{
                        if(j+2 < word.count){
                            if word[j+2] == "a"{
                                possibleCount = possibleCount + 3
                            }
                        }
                    }
                case "y":
                    if word[j+1] == "e"{
                        possibleCount = possibleCount + 2
                    }
                case "w":
                    if(j+2 < word.count){
                        if word[j+1] == "o" && word[j+2] == "o"{
                            possibleCount = possibleCount + 3
                        }
                    }
                case "m":
                    if word[j+1] == "a"{
                        possibleCount = possibleCount + 2
                    }
                default :
                    continue
                }
            }
            
            if word.count == possibleCount{
                answer = answer + 1
            }
            possibleCount = 0
            
        }
    }
    return answer
}
extension String{
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
