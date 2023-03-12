var input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var f = input[0]
var s = input[1]
var g = input[2]
var u = input[3]
var d = input[4]

var visited = Array(repeating: false, count: f+1)
var distance = Array(repeating: 0, count: f+1)
var queue = [Int]()
var idx = 0
var noMove = false
if(s != g){
    queue.append(s)
}else{
    noMove = true
}

distance[s] = 0
visited[s] = true
while(idx<queue.count){
    var now = queue[idx]
    idx += 1
    var ux = now + u
    var dx = now - d
    if (ux==g || dx == g){
        distance[g] = distance[now]+1
        break
    }
    if(1...f ~= ux && !visited[ux]){
        queue.append(ux)
        distance[ux] = distance[now] + 1
        visited[ux] = true
    }
    if(1...f ~= dx && !visited[dx]){
        queue.append(dx)
        distance[dx] = distance[now] + 1
        visited[dx] = true
    }
}
if(noMove){
    print(0)
}else if(distance[g]==0){
    print("use the stairs")
}else{
    print(distance[g])
}



