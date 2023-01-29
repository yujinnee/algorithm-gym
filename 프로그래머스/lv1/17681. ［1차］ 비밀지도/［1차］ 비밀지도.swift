func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var map = [String]()
    for i in 0..<n{
        var str = ""
        var arrFirst = makeBinary(n: arr1[i],num: n)
        var arrSecond = makeBinary(n: arr2[i],num: n)
        for j in 0..<n{
           if (arrFirst[j]==1 || arrSecond[j]==1){
            str.append("#")
        } else{
               str.append(" ")
           }
    }
        answer.append(str)
    }
    return answer
}

func makeBinary(n: Int,num: Int)->[Int]{
    var binary = [Int]()
    var n = n

    while(n>=2){
        binary.append(n%2)
        n=n/2
    }
    binary.append(n)
    for i in 0..<num-binary.count{
        binary.append(0)
    }
    binary = binary.reversed()
    return binary
}