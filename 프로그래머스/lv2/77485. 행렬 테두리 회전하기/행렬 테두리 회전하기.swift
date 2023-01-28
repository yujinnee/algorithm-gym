import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var answers = [Int]()
    var board : [[Int]] = Array(repeating: Array(repeating: 0,count:columns ), count: rows)
    //행렬판 만들기
    var k=1
    for i in 0..<rows{
        for j in 0..<columns{
                board[i][j]=k
            k=k+1

        }
    }

    var min = 0 
    for query in queries{
        
        min = rotate(board: &board,query: query)
        answers.append(min)
    }

    return answers
}

func rotate(board: inout [[Int]],query:[Int]) -> Int{
    let x1=query[0]-1
    let y1=query[1]-1
    let x2=query[2]-1
    let y2=query[3]-1
    
    var tmp = board[x1][y1]
    var min=tmp
    
    //위쪽으로 한칸씩 보내기
    for i in x1..<x2{
        board[i][y1]=board[i+1][y1]
        min = min > board[i+1][y1] ? board[i+1][y1] : min

    }
    //왼쪽으로 한칸씩 보내기
    for i in y1..<y2{
        board[x2][i]=board[x2][i+1]
       min = min > board[x2][i+1] ? board[x2][i+1] : min
    }
     //아래쪽으로 한칸씩 보내기
    for i in stride(from: x2, to: x1, by: -1){
        board[i][y2]=board[i-1][y2]
        min = min > board[i-1][y2] ? board[i-1][y2] : min
    }
    
    //오른쪽으로 한칸씩 보내기
    for i in stride(from: y2, to: y1, by: -1){
        board[x1][i]=board[x1][i-1]
        min = min > board[x1][i-1] ? board[x1][i-1] : min
    }
    
    board[x1][y1+1]=tmp
    
    return min
    
    
}