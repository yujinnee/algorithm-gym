import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var judges = times
    // judges.sorted()
    let minTime = judges[0]
    func getPersonNum(_ time: Int) -> Int { // 이 시간안에 최대 인원
        let sum = judges.map{time/$0}.reduce(0,+)
        // print(sum)
        return sum
    }
    
    
    // print(judges)
    
    var start = 1
    var end = minTime*n
    var count = 0
    while true {
        count += 1
        // print("start\(start)")
        // print("end\(end)")
        var mid = (start + end) % 2 == 0 ? (start + end) / 2 : (start + end) / 2 + 1
        // print("mid\(mid)")
        let personNum = getPersonNum(mid)
        // print("personNum\(personNum)")
        if personNum >= n {
            end = mid
        }else {
            start = mid
        }
        if start == end || start + 1 == end { break }
    }
    // print(start)
    
    return Int64(end)
}