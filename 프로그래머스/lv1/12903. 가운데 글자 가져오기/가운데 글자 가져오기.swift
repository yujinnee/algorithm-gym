func solution(_ s:String) -> String {
    var answer = ""
    var arrS = Array(s)
    if ((arrS.count%2)==0){
       answer.append(arrS[arrS.count/2-1])
        answer.append(arrS[arrS.count/2])
    }else{
        answer.append(arrS[arrS.count/2])
    }
    return answer
}