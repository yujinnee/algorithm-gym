var input = Int(String(readLine()!))!
var n = input
input = Int(String(readLine()!))!
var m = input
var parent = [0]
for i in 1...n{
    parent.append(i)
}

for i in 0..<n{
    var line = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    for j in line.indices{
        if(line[j]==1){
            union(i+1,j+1)
        }
    }
   
}


var plan = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var available = "YES"
for i in 0..<plan.count-1{
    var from = plan[i]
    var to = plan[i+1]
    if(!isUnion(from,to)){
        available = "NO"
    }
}
print(available)

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
