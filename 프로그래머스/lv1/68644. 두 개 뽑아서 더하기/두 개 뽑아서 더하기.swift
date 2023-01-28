import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer = [Int]()
    var sum = 0
    for i in numbers.indices{
        for j in i+1..<numbers.count{
            sum = numbers[i]+numbers[j]
            if(!answer.contains(sum)){
                 answer.append(sum)
            }
           
        }
    }
    answer = answer.sorted()
    return answer
}