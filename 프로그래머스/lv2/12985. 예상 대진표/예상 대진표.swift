import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{   var a = a
    var b = b
    var answer = 1
    var min = a
    while(true){

        if(abs(a-b)==1){//둘이 연이은 숫자가 됐을 때
            min = a < b ? a : b
            if ((min%2) != 0){//둘중에 작은 숫자가 홀수이면 같은 경기에서 만난거
                break
            }else{
                if(a%2==0){
                a=a/2
            }else{
                a=(a+1)/2
            }

            if(b%2==0){
                b=b/2
            }else{
                b=(b+1)/2
            }
            answer += 1
               
            }
       
        }else{
            if(a%2==0){
                a=a/2
            }else{
                a=(a+1)/2
            }

            if(b%2==0){
                b=b/2
            }else{
                b=(b+1)/2
            }
            answer += 1
        }
        
        
        
    }
    
    
       // 1        2
     // 1   2    3   4
    // 1 2 3 4  5 6 7 8 

 
 
//        1                  2
//    1.      2.       3.          4
//  1   2   3   4   5     6     7     8
 //1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16

    return answer
}