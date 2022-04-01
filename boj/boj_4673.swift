import Foundation

var isSelfNumArray = Array<Bool>()

for _ in 0...10000-1{
    isSelfNumArray.append(true)
    
}

for i in 1...10000{
    
    let dNum = getDNum(num: i)
    if(dNum<=10000){
        isSelfNumArray[dNum-1] = false
    }
    

}

for i in 0...isSelfNumArray.count-1{
    if isSelfNumArray[i] == true{
        print(i+1)
    }
}


func seperator(num: Int) -> Array<Int>{
    var seperatedNum = Array<Int>()
    var num = num
    while num > 0 {
        let a = num%10
        seperatedNum.append(a)
        num = num/10
    }
    seperatedNum = seperatedNum.reversed()
    return seperatedNum
}

func getSumOfArray(arr: Array<Int>) -> Int{
    var sum = 0
    for i in 0...arr.count-1{
        sum+=arr[i]
    }
    return sum
}

func getDNum(num: Int) -> Int{
    let originNum = num
    
    let seperateNum = seperator(num: originNum)
    let seperateNumSum = getSumOfArray(arr: seperateNum)
    
    let dnum = seperateNumSum + num
    return dnum
    
}


