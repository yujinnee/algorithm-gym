import Foundation

func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    var answer = [Int]()
    var sx = startX
    var sy = startY
    for b in balls{
        
        var tx = b[0]
        var ty = b[1]
        var candidates = [Int]()
        var coordinates = [(tx,2*n-ty),(2*m-tx,ty),(tx,-ty),(-tx,ty)]
        
        if(sx == tx){
            if(sy>ty){
                for i in 0..<4{
                if(i==2){
                    continue
                }
            var dist = calDistance(sx,sy,coordinates[i].0,coordinates[i].1)
            candidates.append(dist)
            }
            }else{
                for i in 0..<4{
                if(i==0){
                    continue
                }
            var dist = calDistance(sx,sy,coordinates[i].0,coordinates[i].1)
            candidates.append(dist)
            }
            }
            
        }else if (sy == ty){
            if(sx>tx){
                for i in 0..<4{
                if(i==3){
                    continue
                }
            var dist = calDistance(sx,sy,coordinates[i].0,coordinates[i].1)
            candidates.append(dist)
            }
            }else{
                for i in 0..<4{
                if(i==1){
                    continue
                }
            var dist = calDistance(sx,sy,coordinates[i].0,coordinates[i].1)
            candidates.append(dist)
            }
            }
            
        }else{
           for i in 0..<4{
            var dist = calDistance(sx,sy,coordinates[i].0,coordinates[i].1)
            candidates.append(dist)
            } 
        }
        // print(candidates)
        answer.append(candidates.min()!)
    }
    
    return answer
}

func calDistance(_ x1:Int,_ y1:Int,_ x2:Int,_ y2:Int)->Int{
    return (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)
}