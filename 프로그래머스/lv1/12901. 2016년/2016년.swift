func solution(_ a:Int, _ b:Int) -> String {
    var mon = a
    var day = b
    var totalDay=0
    for i in 1..<a{
        totalDay += daysNumber(month: i)
    }
    totalDay += b
    switch(totalDay%7){
        case 0: return "THU"
        case 1: return "FRI"
        case 2: return "SAT"
        case 3: return "SUN"
        case 4: return "MON"
        case 5: return "TUE"
        case 6: return "WED"
        default: return ""
    }

}
func daysNumber(month: Int) -> Int{
    switch(month){
        case 1,3,5,7,8,10,12: return 31
        case 4,6,9,11: return 30
        case 2: return 29
        default: return 0
    }
}