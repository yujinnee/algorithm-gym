import Foundation

var n = Int()
var m = Int()
if let input = readLine() {
    let arrInput = input.components(separatedBy: " ")
    n = Int(arrInput[0])!
    m = Int(arrInput[1])!
}
var paper = [[Int]]()

for _ in 0..<n{
    if let input = readLine(){
        let arrInput = input.components(separatedBy: " ").map{Int($0)!}
        paper.append(arrInput)
    }
}
var visited = Array(repeating:Array(repeating:false,count:m),count: n)

var count = 0
var currentSize = 0
var maxSize = 0

for i in 0..<n{
    for j in 0..<m{
        if(!visited[i][j] && paper[i][j] == 1){
            dfs(i,j)
            count += 1
            if currentSize>maxSize{
                maxSize = currentSize
            }
            currentSize = 0
        }
        
    }
}

func dfs(_ i:Int,_ j:Int){
    
    visited[i][j] = true
    paper[i][j] = 2
    currentSize += 1
    if(i-1>=0 && !visited[i-1][j] && paper[i-1][j] == 1){
        dfs(i-1,j)
    }
    if(j-1>=0 && !visited[i][j-1] && paper[i][j-1] == 1){
        dfs(i,j-1)
    }
    if(i+1<n && !visited[i+1][j] && paper[i+1][j] == 1){
        dfs(i+1,j)
    }
    if(j+1<m && !visited[i][j+1] && paper[i][j+1] == 1){
        dfs(i,j+1)
    }
    
}

print(count)
print(maxSize)