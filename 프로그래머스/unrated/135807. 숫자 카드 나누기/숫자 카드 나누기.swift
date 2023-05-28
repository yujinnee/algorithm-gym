func gcd(_ a: Int, _ b: Int) -> Int{
    if (b == 0) { return a }
    return gcd(b, a % b)
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let sortedA = arrayA.sorted(by: <)
    let sortedB = arrayB.sorted(by: <)
    var gcdA = sortedA[0]
    if sortedA.count > 1 {
        for i in 1...sortedA.count-1 {
            gcdA = gcd(sortedA[i], gcdA)
            if gcdA == 1 {
                break
            }
        }
    }
    var gcdB = sortedB[0]
    if sortedB.count > 1 {
        for i in 1...sortedB.count-1 {
            gcdB = gcd(sortedB[i], gcdB)
            if gcdB == 1 {
                break
            }
        }
    }
    if gcdA == 1 && gcdB == 1 {
        return 0
    }
    if gcdA != 1 {
        for i in 0...sortedB.count-1 {
            if sortedB[i]%gcdA == 0 {
                gcdA = 0
                break
            }
        }
    } else {
        gcdA = 0
    }
    if gcdB != 1 {
        for i in 0...sortedA.count-1 {
            if sortedA[i]%gcdB == 0 {
                gcdB = 0
                break
            }
        }
    } else {
        gcdB = 0
    }
    return max(gcdA, gcdB)
}