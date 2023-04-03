func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    //진법
    //미리구할 숫자 t
    //게임참가인원 m
    //튜브 순서 p
    // 123456789 10 11 12 13 14 15 16
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
    
    // answer.removeLast()
    
    return answer
}