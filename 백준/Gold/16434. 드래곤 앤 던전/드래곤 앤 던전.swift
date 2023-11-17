import Foundation

var input = readLine()!.split(separator: " ").compactMap{Int($0)!}
let n:Int = input[0]
var myAtk:Int = input[1]

var answerNeedHp:Int = 0 // 필요한 hp 양들을 쌓아나간다고 생각
var havePotion:Int = 0
var ans:Int = 0
for _ in 0..<n{
    input = readLine()!.split(separator: " ").compactMap{Int($0)!}
    let t:Int = Int(input[0])
   
//    print("havePotion\(havePotion)")
//    print("t:\(t)")
    if t == 1{//몬스터 일 때
        let enemyAtk:Int = input[1]
        let enemyHp:Int = input[2]

        //몬스터한테 맞는 횟수 =  몬스터체력 / 내 공격력
        let hittedCount:Int = enemyHp%myAtk == 0 ? enemyHp/myAtk - 1 : enemyHp/myAtk // 딱 나눠떨어지게 때리면 한번 덜 맞음.
//        print("count:\(hittedCount)")
        
        //이번 라운드에서 필요한 최소 체력 계산
        answerNeedHp += (enemyAtk*hittedCount)//딜 맞는 양
        
         // 딜 맞는 수만큼 버틸 체력 필요함.최소 체력 1남아있어야 되서 1더하기
//        print("answerNeedHp\(answerNeedHp)")
//        if(enemyHp%myAtk == 0){answerNeedHp += enemyAtk*((enemyHp/myAtk) - 1)}
//        else {answerNeedHp += enemyAtk*(enemyHp/myAtk) }
        
    }else {// 포션 일 때
        let potionPower:Int = input[1]
        let potionLife:Int = input[2]
        myAtk += potionPower
//        havePotion += potionLife
        answerNeedHp -= potionLife
        if(answerNeedHp<0) {answerNeedHp = 0 }
        
       
//        answerHp = answerHp - potionLife > 0 ? answerHp-potionLife : 0
        
    }
    ans = max(ans, answerNeedHp);
//    print("answerHp\(answerHp)")
    
    
}
//
//if(answerNeedHp<1){
//    answerNeedHp = 1
//}
print(ans+1)
