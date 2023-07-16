

struct Flower {
    var sMonth: Int
    var sDay: Int
    var eMonth: Int
    var eDay: Int
    var length: Int{
        var sum = 0
        if(sMonth == eMonth){
            sum += eDay-sDay
        }else{
            sum += getEndDay(month: sMonth)-sDay
            for m in sMonth+1..<eMonth{
                sum += getEndDay(month: m)
            }
            sum += eDay
        }
        
        return sum
    }
    init(sMonth:Int,sDay:Int,eMonth:Int,eDay:Int){
        self.sMonth = sMonth
        self.sDay = sDay
        self.eMonth = eMonth
        self.eDay = eDay
    }
}

func getEndDay(month: Int)->Int{
    switch month{
    case 4,6,9,11: return 30
    case 1,3,5,7,8,10,12: return 31
    default: return 28
    }
}

func isIncluded(flower:Flower, month: Int, day: Int)->Bool{
    if(flower.sMonth == month){
        return flower.sDay <= day ? true : false
    }else if(flower.eMonth == month){
        return flower.eDay > day ? true : false
    } else {
        return flower.sMonth...flower.eMonth ~= month ? true : false
    }
    
}

func getFromNowOnLength(f:Flower,nowMonth:Int,nowDay:Int)->Int{
    
    if(nowMonth == f.eMonth){
        return f.eDay - nowDay
    }else{
        var sum = 0
        sum += getEndDay(month: nowMonth)-nowDay
        for m in nowMonth+1...f.eMonth{
            sum += getEndDay(month: m)
        }
        sum += f.eDay
        return sum
    }
}

let n = Int(readLine()!)!
var flowers = [Flower]()
for _ in 0..<n{
    var input = readLine()!.split(separator: " ").compactMap{Int($0)!}
    var flower = Flower(sMonth: input[0], sDay: input[1], eMonth: input[2], eDay: input[3])
    flowers.append(flower)
}

var result = 0
var nextMonth = 3
var nextDay = 1
var isPossible = true

loop: for m in 3...11{
    for d in 1...getEndDay(month: m){
//        print("nextMonth\(nextMonth)")
//        print("nextDay\(nextDay)")
        if(m == nextMonth && d == nextDay){
            
//            print("\(m)월 \(d)일")
            var candidates = [(Flower,Int)]()
//            print(flowers)
            for f in flowers{
                if(isIncluded(flower: f, month: m, day: d)){
                    candidates.append((f,getFromNowOnLength(f: f, nowMonth: m, nowDay: d)))//지금 날짜로부터 몇일 더 피어있을 수 있는지
                }
            }
//            print(candidates)
            if(candidates.isEmpty){
                isPossible == false
                break loop
            }else{
                candidates.sort{$0.1>$1.1}
//                for c in candidates{
//                    print(c)
//                    print(c.1)
//                }
                
                nextMonth = candidates.first!.0.eMonth
                nextDay = candidates.first!.0.eDay
                result += 1
            }
            
        }else{
            continue
        }
        
    }
}
if(nextMonth == 12){
    isPossible = true
}else{
    isPossible = false
}

print(isPossible ? result : 0)



