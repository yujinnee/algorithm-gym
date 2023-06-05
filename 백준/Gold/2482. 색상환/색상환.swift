var n = Int(readLine()!)!
var k = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
dp[0][0] = 1
dp[0][1] = 0
dp[1][0] = 1
dp[1][1] = 1

dp[2][0] = 1
dp[3][0] = 1
dp[2][1] = 2
dp[3][1] = 3

for i in 1...n{
    dp[i][0] = 1
}
for j in 1...k{
    dp[0][j] = 0
}

for i in 4...n{
    for j in 1...k{
        if(j>i/2){
            break
        }

        dp[i][j] = (dp[i-1][j]%1000000003 + dp[i-2][j-1]%1000000003)%1000000003

    }
}

print(dp[n][k])
