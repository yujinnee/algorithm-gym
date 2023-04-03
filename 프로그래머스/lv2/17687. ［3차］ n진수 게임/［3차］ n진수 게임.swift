func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var answer = ""
    var decimal = 0 
    var nums = [Character]()
    var finalOrder = t*m
    for i in 0..<finalOrder{
        var num = String(decimal,radix:n).uppercased()
        nums.append(contentsOf:Array(num))
        decimal+=1
    }
    for i in 0..<finalOrder where i%m==p-1{
        answer.append(nums[i])
    }
    
    return answer
}