import Foundation

func solution(_ board:[String]) -> Int {
    
    var map = [[Character]]()
    for b in board{
        var line = [Character]()
        line = Array(b)
        map.append(line)
    }
    var dotCount = 0
    var OCount = 0
    var XCount = 0
    for i in 0..<3{
        for j in 0..<3{
            if(map[i][j] == "."){
            dotCount += 1
        }else if(map[i][j] == "O"){
                OCount += 1
            }else{
                XCount += 1
            }
        }
        
    }
    var roundCount = 9-dotCount

     func hasBingo(_ target: Character)->Bool{
        
        for i in 0..<map.count{
             var arr = Array<Character>()
            for j in 0..<map[0].count{
                if(map[i][j] == target){
                arr.append(map[i][j])
                }
            }
            if(arr.count == 3){
                return true
            }
        }
        
        for j in 0..<map[0].count{
             var arr = Array<Character>()
            for i in 0..<map.count{
                if(map[i][j] == target){
                arr.append(map[i][j])
                }
            }
            if(arr.count == 3){
                return true
            }
        }
        
        var diaLeftSet = Set<Character>()
        var diaRightSet = Set<Character>()
        
        diaLeftSet.insert(target)
        diaLeftSet.insert(map[0][0])
        diaLeftSet.insert(map[1][1])
        diaLeftSet.insert(map[2][2])
        if(diaLeftSet.count==1){return true}
        
        diaRightSet.insert(target)
        diaRightSet.insert(map[0][2])
        diaRightSet.insert(map[1][1])
        diaRightSet.insert(map[2][0])
        if(diaRightSet.count==1){return true}
        
        return false
    }
    
    if (roundCount % 2 == 0){
        if(XCount != OCount){
            return 0
        }else{
             if(hasBingo("O")){
                
                 return 0
             }
        }
       
    }else{
        if(XCount+1 != OCount){
            return 0
        }else{
            if(hasBingo("X")){
                return 0
            }
        }
    }

    return 1
}


