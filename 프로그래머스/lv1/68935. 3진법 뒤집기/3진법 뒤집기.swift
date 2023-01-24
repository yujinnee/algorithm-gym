import Foundation

func solution(_ n:Int) -> Int {
    let triNum = deciToTri(n: n)
    let reversedTriNum = String(String(triNum).reversed())
    let deciNum = triToDeci(n: Int(reversedTriNum)!)
    
    return deciNum
}

func deciToTri(n :Int) -> Int{
    var n = n
    var answer = ""
    while(n>=3){
        answer.append(String(n%3))
        n = n/3
    }
    
    if(n != 0){
         answer.append(String(n))
    }
    let reversedAnswer = String(answer.reversed())
 
    return Int(reversedAnswer)!
    
}

func triToDeci(n: Int) -> Int {
    var n =  Array(String(n))
    var reversed: () = n.reverse()
    // var n = Array(String(n).reversed())
    var answer = 0.0
    print("n\(n)")
    for i in n.indices{
        print(n[i])
        answer += Double( String(n[i]) )! *  pow(3.0,Double(i)) 
        print("answer\(answer)")
    }
    return Int(answer)
   
    
}
