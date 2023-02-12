import Foundation

func solution(_ n:Int) -> [Int] {
    var n = n
    var array = Array(repeating: Array(repeating: 0,count : n),count:n)
    
    var k = -1
    var l = 0
    var num = 1
    var count = 0
    for i in stride(from:n,to:0,by:-1){
        count += 1
        for j in 0..<i{

            switch count%3{
            case 0://대각선
                    k -= 1
                    l -= 1
                array[k][l] = num
                num += 1
                
            case 1://아래로
                
                    k += 1
                array[k][l] = num
                num += 1
            case 2://옆으로
                l+=1
                array[k][l] = num
                num += 1
            default:
                break
            }
        }
    }
    var answer = [Int]()
    for i in 0..<n{
        for j in 0...i{
            answer.append(array[i][j])
        }
    }
    
    return answer
}
