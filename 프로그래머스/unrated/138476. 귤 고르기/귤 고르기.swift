import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var tuples = [(Int,Int)]()
   
    var maxNum = tangerine.max()!

    var arr = Array(repeating:0,count: maxNum + 1)
    for t in tangerine{
        arr[t] += 1
    }
    for i in arr.indices {
        tuples.append((i,arr[i]))
    }
    tuples.sort{$0.1>$1.1}
    var sum = 0 
    var ans = 0

    for i in tuples.indices{
        sum += tuples[i].1
        if (sum >= k){
            ans = i + 1
            break
        }
    }
    return ans
}