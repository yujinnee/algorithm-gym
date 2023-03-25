func solution(_ files:[String]) -> [String] {
    
    var fileTuples = [(head: String, number: String, tail: String)]()
    for file in files{
        var head = ""
        var number = ""
        var tail = ""
        var isCompleted = false
        for c in file{
           if(!c.isNumber && !isCompleted){
               head.append(c)
           } else if (c.isNumber && tail.count==0){
               number.append(c)
               isCompleted = true
           } else{
               tail.append(c)
           }
        }
        fileTuples.append((head,number,tail))
    }
    let sortedFileTuples=fileTuples.sorted{($0.head.lowercased(),Int($0.number)!)<($1.head.lowercased(),Int($1.number)!)}
    var answer = [String]()
    for f in sortedFileTuples{
            var string = f.head+f.number+f.tail
            answer.append(string)
        }
    
    
    return answer
}