import Foundation

func solution(_ s:String) -> Int {
    //미해결 코드입니다.
//    var s = Array(s)
    var originLength = s.count
    var substring = ""
    var min = originLength
    
    for i in 1...s.count/2{
        var compressNumber = 0
        for j in stride(from: 0, to: s.count-1, by: i){
            if(j+i-1<s.count){
                if(substring == s.subString(from: j, to: j+i-1)){
                    compressNumber += 1
                }else{
                    substring = s.subString(from: j, to: j+i-1)
                }
                substring = s.subString(from: j, to: j+i-1)
            }
        }
        var compressedLength = originLength - compressNumber*(i-1)
        if compressedLength <= min{
            min = compressedLength
        }
    }
    return min
}

extension String {

    func subString(from: Int, to: Int) -> String {

        let startIndex = self.index(self.startIndex, offsetBy: from)

        let endIndex = self.index(self.startIndex, offsetBy: to)

        return String(self[startIndex...endIndex])

    }

}
