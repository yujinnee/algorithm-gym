func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visit = Array(repeating : false ,count : words.count)
    var answer = Int.max

    func dfs(_ start : String, _ count: Int  ) {
        if start == target {
            answer = min(answer,count)
            return
        }
        for i in 0..<words.count {
             if visit[i] == false && zip(start,words[i]).filter{$0 != $1}.count == 1  {
                visit[i] = true
                dfs(words[i], count+1)
                visit[i] = false
            }
        }
    }
    
    dfs(begin, 0)
    return answer == Int.max ? 0 : answer
}