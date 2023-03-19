var n = Int(readLine()!)!


if(n==1){
    print("1")
}else if(n==2){
    print("2")
}else{
    var dp = Array(repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n{
        dp[i] = (dp[i-2]+dp[i-1] ) % 10007
    }
   
    print(dp[n])
}