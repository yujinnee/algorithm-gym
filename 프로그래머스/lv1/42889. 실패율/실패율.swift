import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var arrFailRate = [(rate:Double,stage:Int)]()
    
    var uncomplete = Array(repeating: 0, count: N) // 각 1~N 스테이지에 머물러있는사람
    var challengers = Array(repeating: 0, count: N) // 각 1~N 스테이지에 머물러있는사람 + 패스한 사람
    
    //각 이용자들 현재 스테이지 하나씩 확인
    for stage in stages{
        //현재 스테이지가 아닌 과거 스테이지들 횟수 추가 해주기
        for i in 1..<stage{
            challengers[i-1] += 1
        }
        //stage변수는 현재 도전 중인 스테이지니 uncomplete,challengers 모두 1씩 추가해주기
        if(stage != N+1){
            uncomplete[stage-1] += 1
                         challengers[stage-1] += 1
        }else{ //stage가 N+1인 경우는 현재 도전 중인 스테이지가 없으니 패스
            continue
        }

    }
    for i in 0..<N{
            arrFailRate.append((rate: Double(uncomplete[i])/Double(challengers[i]), stage: i+1))
        }
  
     // arrFailRate.sorted{ ($0.rate > $1.rate) || ($0.stage < $1.stage) }
    arrFailRate.sort(by:{ ($0.rate > $1.rate) || ($0.stage < $1.stage) })
  
    var arrFail = [Int]()
   for i in 0..<N{
       arrFail.append(arrFailRate[i].stage)
   }
    return arrFail
}