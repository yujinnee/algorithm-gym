import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var judges = times

    let minTime = judges[0]
    func getPersonNum(_ time: Int) -> Int { // 이 시간안에 최대 인원
        let sum = judges.map{time/$0}.reduce(0,+)
        return sum
    }
    
    var start = 0
    var end = minTime*n

    var answer = end
    while start <= end {
        var mid = (start + end) / 2

        let personNum = getPersonNum(mid)

        if personNum >= n {
            answer = mid
            end = mid - 1
        }else {
            start = mid + 1
        }
       
    }
    
    return Int64(answer)
}