import Foundation

func solution(_ numbers:[Int64]) -> [Int] {
    func valid(_ s: [Character]) -> Bool {
        if s.count == 1 { return true }

        let center = s.count / 2
        let front = Array(s[..<center])
        let rear = Array(s[(center+1)...])

        if s[center] == "0" && (front.contains("1") || rear.contains("1")) {
            return false
        }

        return valid(front) && valid(rear)
    }

    var result: [Int] = []
    for n in numbers {
        let bin = String(n, radix: 2)
        let len = bin.count
        let totalLen = pow(2, Double(Int(log2(Double(len))) + 1)) - 1
        let zeros = String(repeating: "0", count: Int(totalLen) - len)
        let temp = Array(zeros + bin)

        result.append(valid(temp) ? 1 : 0)
    }
    return result
}