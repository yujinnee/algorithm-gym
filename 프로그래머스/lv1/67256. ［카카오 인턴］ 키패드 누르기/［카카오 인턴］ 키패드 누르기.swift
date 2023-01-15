import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {

    var answer: String = ""
    var leftHandPos = 10 //왼손의 현재 위치를 담을 변수, 처음 위치인 * 위치를 위치상 10으로 대입하여 지정
    var rightHandPos = 12//오른손의 현재 위치를 담을 변수, 처음 위치인 # 위치를 위치상 12으로 대입하여 지정
    

    for num in numbers {
        switch num{
        case 1,4,7:
            answer.append("L")
            leftHandPos = num

        case 3,6,9:
            answer.append("R")
            rightHandPos = num
        case 2,5,8,0:
            var movedHand = compareDistance(target: num, leftPos: leftHandPos, rightPos: rightHandPos, hand: hand)
            answer.append(movedHand)
            if(movedHand == "L"){
                leftHandPos = num
            }else{
                rightHandPos = num
            }

        default:
            answer.append("")
        }


    }

    return answer
}

//타겟 숫자의 위치와 현재 왼손, 오른손의 위치를 비교해주는 함수
func compareDistance(target num: Int, leftPos: Int, rightPos: Int, hand: String) -> String{
    var num  = num
    var leftPos = leftPos
    var rightPos = rightPos

    //삼항 연산자를 이용하여 키패드의 숫자가 0일 경우 11로 임의 지정하여 거리 계산에 이용할 수 있도록 변환해줌
    num = num == 0 ? 11 : num
    leftPos = leftPos == 0 ? 11 : leftPos
    rightPos = rightPos == 0 ? 11 : rightPos

    if (getDistance(target: num, nowPos: leftPos) < getDistance(target: num, nowPos: rightPos)){
        return "L"
    }else if(getDistance(target: num, nowPos: leftPos) > getDistance(target: num, nowPos: rightPos)){
        return "R"
    }else{
        if(hand == "left"){
            return "L"
        }else{
            return "R"

        }
    }



}

//타겟 숫자의 위치와 인자로 들어온 숫자 위치 간의 거리를 계산하여 반환해주는 함수
func getDistance(target: Int, nowPos: Int) -> Int{
    if(abs(target - nowPos) == 1 || abs(target - nowPos) == 3){
        return 1
    }else if (abs(target - nowPos) == 2 || abs(target - nowPos) == 4 || abs(target - nowPos) == 6){
        return 2
    }else if (abs(target - nowPos) == 5 || abs(target - nowPos) == 7 || abs(target - nowPos) == 9){
        return 3
    }else if (abs(target - nowPos) == 8 || abs(target - nowPos) == 10){
        return 4
    }else{
        return 0
    }
}