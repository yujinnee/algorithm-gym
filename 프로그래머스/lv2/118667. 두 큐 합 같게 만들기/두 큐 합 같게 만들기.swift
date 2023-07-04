import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue1 = queue1
    var queue2 = queue2
    var queue1sum = queue1.reduce(0,+)
    var queue2sum = queue2.reduce(0,+)
    // var total = queue1sum + queue2sum
    
//     if(total%2==1){
//         return -1
//     }
    // var target = total / 2
    var count = 0
    var limit = queue1.count*2
    
    var idx1 = 0
    var idx2 = 0
    var flag = false
    
    while(queue1.count <= limit){
        
        
        if(queue1sum<queue2sum){
            queue1sum += queue2[idx2]
            queue2sum -= queue2[idx2]
            queue1.append(queue2[idx2])
            idx2 += 1
        }else if(queue1sum>queue2sum){
            queue1sum -= queue1[idx1]
            queue2sum += queue1[idx1]
            queue2.append(queue1[idx1])
            idx1 += 1
        }else{
           return count
        }
        count += 1
        
    }
    
    // if(queue1sum != target){
    //     return -1
    // }
    
    
    
    return -1
}
