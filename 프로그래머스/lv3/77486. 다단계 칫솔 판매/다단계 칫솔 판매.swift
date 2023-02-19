import Foundation


func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var parentDic:[String:String] = [:]
    var profitDic:[String:Int] = [:]
    
    for i in 0..<enroll.count {
        profitDic[enroll[i]] = 0
        parentDic[enroll[i]] = referral[i]
    }
    
    for i in 0..<seller.count {
        var tenPercent:Int = amount[i]*100
        var parent:String = seller[i]
        while parent != "-" && tenPercent > 0 {
            profitDic[parent]! += tenPercent - tenPercent/10
            parent = parentDic[parent]!
            tenPercent = tenPercent/10
        }
    }
    return enroll.map{profitDic[$0]!}
}
