var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var n = input[0]
var m = input[1]
var parent = [Int]()
for i in 0...n{
    parent.append(i)
}
var graph = [(x:Int,y:Int,value:Int)]()

for i in 0..<m{
    var line = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    graph.append((line[0],line[1],line[2]))
}

graph = graph.sorted{$0.value<$1.value}

var value = 0
var count = 0

for i in graph.indices{
    if(count==n){
        break
    }
    var from = graph[i].x
    var to = graph[i].y
    if(isUnion(from,to)){
        continue
    }else{
        union(from,to)
        value += graph[i].value
        count += 1
    }
}
print(value)

func find(_ x: Int)->Int{
    if(x==parent[x]){
        return x
    }
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ x: Int,_ y: Int){
    var x = find(x)
    var y = find(y);
    if (x == y) {return}
    if (x < y) {
        parent[y] = x
    }else{
        parent[x] = y
        
    }
}
func isUnion(_ x: Int,_ y: Int)->Bool{
    var x = find(x)
    var y = find(y)
    return x == y
}
