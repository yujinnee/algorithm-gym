var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var n = input[0]
var m = input[1]
var parent = [Int]()
for i in 0...n{
    parent.append(i)
}

for i in 0..<m{
    var line = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    var oprator = line[0]
    var opr1 = line[1]
    var opr2 = line[2]
    if(oprator == 0){
        union(opr1,opr2)
    }else if(oprator == 1){
        if isUnion(opr1,opr2){
            print("YES")
        }else{
            print("NO")
        }
    }else{
        break
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
