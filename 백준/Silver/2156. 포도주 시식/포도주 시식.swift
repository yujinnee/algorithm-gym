import Foundation

let n = Int(readLine()!)!
var nArray = Array(repeating: 0, count: 10001)

for i in 1...n {
    nArray[i] = Int(readLine()!)!
}

var dp = Array(repeating: 0, count: n+1)
dp[1] = nArray[1]

if n > 1 {
    dp[2] = nArray[1] + nArray[2]
}

if n > 2 {
    for i in 3...n {
        dp[i] = max(dp[i-2] + nArray[i], dp[i-3] + nArray[i] + nArray[i-1], dp[i-1])
    }
}

print(dp[n])
