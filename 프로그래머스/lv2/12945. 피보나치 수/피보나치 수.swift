var dp = [Int]()
func solution(_ n:Int) -> Int {
    if n==0 {
       return 0 
    } else if n == 1{
        return 1
    }else{
         dp = Array(repeating: 0,count: n+1)
        dp[0] = 0
        dp[1] = 1
        for i in 2...n{
            
            dp[i]=(dp[i-1]%1234567+dp[i-2]%1234567)%1234567
        }
        return dp[n]
    }
    
}

