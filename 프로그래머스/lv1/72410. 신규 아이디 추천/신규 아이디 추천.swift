import Foundation

func solution(_ new_id:String) -> String {
    //아이디 길이 3자 이상 15자 이하
    //알파벳 소문자, 숫자, -, _, . only
    //마침표 처음과 끝 X, 연속 X
    
    var recom_id: String
    
    //✅ 1단계 : 모든 대문자를 소문자로 치환
    recom_id = new_id.lowercased()
    
    //String을 Array로 변경
    var arr_recom_id = Array(recom_id)
    //
     
 

    //✅ 2단계 : 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거
//    arr_recom_id = arr_recom_id.filter{ $0.isNumber == true || $0.isLowercase == true ||  $0 == "-" || $0 == "_" || $0 == "."}
    var revised_id: Array<Character> = []//조건에 맞는 문자만 뽑아낸 문자열 입시 저장할 변수
    
    for i in 0..<arr_recom_id.count{
        if(arr_recom_id[i].isNumber == true || arr_recom_id[i].isLowercase == true ||  arr_recom_id[i] == "-" || arr_recom_id[i] == "_" || arr_recom_id[i] == "."){
            
            revised_id.append(arr_recom_id[i])
            
        }
    }
    
    arr_recom_id = revised_id
    
    
    //✅ 3단계 : 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환
    revised_id = []//중복된 . 을 제거한 문자열을 임시로 담을 배열 초기화

    revised_id.append(arr_recom_id[0])//첫번째 원소 집어넣어주기
    
    //두번 째 인덱스에 있는 문자열부터 맨 끝 문자열 하나씩 확인
    for i in 1..<arr_recom_id.count{
        
        //현재 인덱스 문자열과 이전 문자열이 둘 다 "."이면 현재 문자열 추가 x
        if(arr_recom_id[i-1]=="." && arr_recom_id[i] == "."){
           continue
        }else{//현재 문자열이 "."이 아니거나 현재문자열이 "."이더라도 앞에 문자열이 "."이 아니므로 일단 추가
            revised_id.append(arr_recom_id[i])
        }
    }
    arr_recom_id = revised_id //중복된 . 이 제거된 문자열이 완성 되어 추천아이디에 재 대입.
    

    
    //✅ 4단계 : 마침표(.)가 처음이나 끝에 위치한다면 제거
    if(arr_recom_id.first == "."){
        arr_recom_id.removeFirst()
    }
    
    if(arr_recom_id.last == "."){
        arr_recom_id.removeLast()
    }
    
    //✅ 5단계 : 빈 문자열이라면, new_id에 "a"를 대입
    if(arr_recom_id.isEmpty == true){
        arr_recom_id.append("a")
    }
    
    //✅ 6단계 : 길이가 16자 이상이면, 앞의 15개의 문자를 제외 모두 제거.
    //만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    
    if(arr_recom_id.count>=16){
        arr_recom_id.removeSubrange(15...arr_recom_id.count-1)//더좋은 범위 연산자가 있나
    }
    if(arr_recom_id.last == "."){
        arr_recom_id.removeLast()
    }
    
    //✅ 7단계 : 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    while(arr_recom_id.count < 3){
            
        arr_recom_id.append(arr_recom_id[arr_recom_id.count-1])
        
    }
    
    recom_id = String(arr_recom_id)
    
    return recom_id
}