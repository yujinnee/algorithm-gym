var input = Int(String(readLine()!))!
var t = input

var parent = [Int]()

for _ in 0..<t{
    var inputs = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    var n = inputs[0]
    var m = inputs[1]
    parent = [Int]()
    
    for i in 0...n{
        parent.append(i)
    }
    
    var count = 0
    
    for i in 0..<m{
        inputs = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
        var x = inputs[0]
        var y = inputs[1]
        if(isUnion(x,y)){
            continue
        }else{
            union(x,y)
            count += 1
        }

    }
    print(count)
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
