func solution(_ s:String) -> String {
    
    let letters = Array(s)
    var isPreviouBlank = true
    var result: String = ""
    
    for letter in letters {
        result += (isPreviouBlank ? letter.uppercased() : letter.lowercased())
        isPreviouBlank = (letter == " ")
    }
    
    return result
}