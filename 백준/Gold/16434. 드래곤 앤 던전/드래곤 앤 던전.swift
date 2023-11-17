import Foundation

var input = readLine()!.split(separator: " ").compactMap{Int($0)!}
let n:Int = input[0]
var myAtk:Int = input[1]

var needHp:Int = 0 // 필요한 hp 양들을 쌓아나간다고 생각
var ans:Int = 0
for _ in 0..<n{
    input = readLine()!.split(separator: " ").compactMap{Int($0)!}
    let t:Int = Int(input[0])

    if t == 1{//몬스터 일 때
        let enemyAtk:Int = input[1]
        let enemyHp:Int = input[2]

        //몬스터한테 맞는 횟수 =  몬스터체력 / 내 공격력
        let hittedCount:Int = enemyHp%myAtk == 0 ? enemyHp/myAtk - 1 : enemyHp/myAtk // 딱 나눠떨어지게 때리면 한번 덜 맞음.

        
        //이번 라운드에서 필요한 최소 체력 계산
        needHp += (enemyAtk*hittedCount)//딜 맞는 양
        
    }else {// 포션 일 때
        let potionPower:Int = input[1]
        let potionLife:Int = input[2]
        myAtk += potionPower
        needHp -= potionLife
        if(needHp<0) {needHp = 0 }
        
    }
    ans = max(ans, needHp);

}

print(ans+1)

