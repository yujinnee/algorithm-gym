
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {

    guard let maxInTimes = times.max() else { return 0 }

    var left: Int64 = 0
    var right: Int64 = Int64(maxInTimes * n)
    var mid: Int64 = (left + right) / 2
    var answer: Int64 = right

    while left <= right {
        mid = (left + right) / 2
        var possible: Int64 = 0
        for time in times {
            possible = possible + Int64((Int(mid) / time))
        }
        // n보다 작을 경우 해당 mid 값 보단 더 커야한다.
        if possible >= n {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return answer
}

// import Foundation

// func solution(_ n:Int, _ times:[Int]) -> Int64 {
//     var judges = times

//     let minTime = judges[0]
//     func getPersonNum(_ time: Int) -> Int { // 이 시간안에 최대 인원
//         let sum = judges.map{time/$0}.reduce(0,+)
//         return sum
//     }
    
//     var start = 1
//     var end = minTime*n
//     var count = 0
//     while true {
//         count += 1
//         var mid = (start + end) % 2 == 0 ? (start + end) / 2 : (start + end) / 2 + 1

//         let personNum = getPersonNum(mid)

//         if personNum >= n {
//             end = mid
//         }else {
//             start = mid
//         }
//         if start == end || start + 1 == end { break }
//     }
    
//     return Int64(end)
// }