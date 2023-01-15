import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var basket = [Int]()
    var numDisappear = 0
    for move in moves{
       
        var column = Int(move) - 1
        for i in 0..<board.count{
            if(board[i][column] != 0){
                var doll = board[i][column]
                if(basket.last == doll){
                    basket.popLast()
                    numDisappear += 2
                    
                }else{
                    basket.append(doll)
                }
                board[i][column] = 0
                break
            }
        }
    }
    return numDisappear
}
