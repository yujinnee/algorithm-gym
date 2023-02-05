import Foundation

func solution(_ citations:[Int]) -> Int {

    let citations = Array(citations.sorted().reversed())


    for i in 0..<citations.count{
        if (i>=citations[i]){
            return i
        }
    }
    
    return citations.count
}

