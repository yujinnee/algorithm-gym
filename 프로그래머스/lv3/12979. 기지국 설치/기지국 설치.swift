func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var count = 0
    var length = 0
    var idx = 0
    let maxDist = (2*w) + 1
    
    while length < n {
        if idx >= stations.count || (stations[idx] - w ) - length > 1  {
            length += maxDist
            count += 1
        }else {
            length = stations[idx]+w
            idx += 1
        }
    }
    return count
}