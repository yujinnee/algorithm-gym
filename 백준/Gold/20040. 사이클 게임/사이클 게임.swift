var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var n = input[0]
var m = input[1]
var parent = [Int]()
for i in 0..<n{
    parent.append(i)
}

for num in 0..<m{
    input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    var x = input[0]
    var y = input[1]
    if(isUnion(x,y)){
        print(num+1)
        break
    }else{
        union(x,y)
    }
    if(num==m-1){
        print("0")
    }
}


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
