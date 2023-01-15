import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    for i in absolutes.indices{
    switch signs[i]{
    case true:
        sum += absolutes[i]
    case false:
        sum -= absolutes[i]
    }
    }
    
    return sum
}