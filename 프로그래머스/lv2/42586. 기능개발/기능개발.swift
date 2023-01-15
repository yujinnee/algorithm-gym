import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var days = [Int]()
    for i in progresses.indices{
        var leftDay = 0
        if ((100-progresses[i])%speeds[i] == 0){
            leftDay = (100-progresses[i])/speeds[i]
        }else{
            leftDay = (100-progresses[i])/speeds[i] + 1
        }
        days.append(leftDay)
    }
    
    
    var maxNumber = days[0]
    var releases = [Int]()
    var release = 0
    for i in days.indices{
        if days[i]<=maxNumber{
            release += 1
        }else if days[i]>maxNumber{
            maxNumber = days[i]
            releases.append(release)
            release = 1
        }
    }
    releases.append(release)
    
    return releases
}

