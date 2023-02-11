func solution(_ n:Int) -> String {
    var answer = ""
    for i in 0..<n{
        switch (i%2){
            case 0 :
            answer.append("수")
            case 1 :
            answer.append("박")
            default:
            break
        }
    }
    return answer
}