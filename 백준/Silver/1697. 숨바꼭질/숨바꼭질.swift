var input = readLine()!.split(separator: " ").compactMap{Int($0)}
var n = input[0]
var k = input[1]

var queue = [Int]()
queue.append(n)

var idx = 0
var visited = Array(repeating: 0, count: 100001)
visited[n] = 1
var solved = false
if (n==k){
    print(0)
}else{
    while(idx<queue.count){
        if(solved) {break}
        var now = queue[idx]
        var nextArr = [now-1,now+1,now*2]
        idx+=1
        for next in nextArr{
            if(0...100000 ~= next && visited[next]==0){
                    queue.append(next)
                    visited[next] = visited[now] + 1
                if(next == k){
                    print(visited[next]-1)
                    solved = true
                    break
                }
                }
        }
    }

}
