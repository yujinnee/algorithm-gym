var n = Int(String(readLine()!))!
var aArr = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var b = input[0]
var c = input[1]

var answer = 0

answer += n
aArr = aArr.map{$0-b}
for a in aArr{
    if (a<=0){
        continue
    }else if(a%c == 0){
        answer += a/c
    }else{
        answer += a/c + 1
    }
}

print(answer)
