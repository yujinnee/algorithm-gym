import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var judges = times

    let minTime = judges[0]
    func getPersonNum(_ time: Int) -> Int { // 이 시간안에 최대 인원
        let sum = judges.map{time/$0}.reduce(0,+)
        return sum
    }
    
    var start = 1
    var end = minTime*n
    var count = 0
    while true {
        count += 1
        var mid = (start + end) % 2 == 0 ? (start + end) / 2 : (start + end) / 2 + 1

        let personNum = getPersonNum(mid)

        if personNum >= n {
            end = mid
        }else {
            start = mid
        }
        if start == end || start + 1 == end { break }
    }
    
    return Int64(end)
}