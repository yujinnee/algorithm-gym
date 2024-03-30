import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var allMusic = Dictionary<String,Array<(Int,Int)>>()
    var genreCounter = Dictionary<String,Int>()
    for i in 0..<genres.count {
        let genreKey = genres[i]
        if allMusic[genreKey] == nil {
             allMusic[genreKey] = [(Int,Int)]()
            genreCounter[genreKey] = 0
        }
       
        allMusic[genreKey]!.append((i,plays[i]))
        genreCounter[genreKey]! += plays[i]

    }

    let sortedArray = genreCounter.sorted{$0.value>$1.value}.map{($0.key,$0.value)}
    
    var answer = [Int]()
    for item in sortedArray {
        let genreKey = item.0
        let playSorted = allMusic[genreKey]!.sorted{$0.1>$1.1 || $0.0<$1.0}.map{$0.0}
       
        if(playSorted.count >= 2) {
            answer.append(playSorted[0])
            answer.append(playSorted[1])
        } else {
            answer.append(playSorted[0])
        }
       
    }

    return answer
}