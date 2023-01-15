import Foundation


func solution(_ nums:[Int]) -> Int {
    var sum = 0
    var numPrimeNumber = 0
    
    for i in 0..<nums.count-2{
        for j in i+1..<nums.count-1{
            for k in j+1..<nums.count{
                sum = nums[i]+nums[j]+nums[k]
                if (isPrime(sum)){
                    numPrimeNumber += 1
                }
            }
        }
    }
    
    return numPrimeNumber
}

func isPrime(_ num: Int)->Bool{
    var sqrtNum = Int(sqrt(Double(num)))
    for i in 2...sqrtNum{
      
        if(num%i == 0){
            return false
        }
    }
    return true
}

