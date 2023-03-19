
import Foundation
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [(city: String,num: Int)]()
    var time = 0
    if (cacheSize == 0){
        return cities.count*5
    }else{
        for i in 0..<cities.count{ //시티하나씩 보면서
            var ishit = false
            for j in 0..<cache.count{//캐시안에 있는지 확인
                if (cities[i].lowercased() == cache[j].city.lowercased()){
                    time += 1
                    cache[j].num = 1
                    ishit = true
                }else{
                    cache[j].num += 1
                }
            }
            
            if (!ishit){//hit 아닐때
                time += 5
                if(cache.count<cacheSize){//캐시 다 안찼을 때
                    
                    cache.append((cities[i],1))
                }else{
                    
                    var long = cache[0].num
                    var idx = 0
                    for j in 1..<cache.count{
                        if(cache[j].num>long){
                            long = cache[j].num
                            idx = j
                        }
                    }
                    cache[idx] = (cities[i],1)
                }
                
                
            }
        }
    }
    
    
    
    return time
}

