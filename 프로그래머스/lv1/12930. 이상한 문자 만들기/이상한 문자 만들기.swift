func solution(_ s:String) -> String {
    var answer = ""
    var count = 1
        for c in s{
            if c==" "{
                count = 1
                answer.append(" ")
            }else{
                count += 1
                var c = count%2 == 0 ? c.uppercased() : c.lowercased()
            answer.append(c)
            }
        }
    return answer
}