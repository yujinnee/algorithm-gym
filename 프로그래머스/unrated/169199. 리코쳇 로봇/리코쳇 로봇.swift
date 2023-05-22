func solution(_ board: [String]) -> Int {
    var visited = Array(repeating: Array(repeating: Int.max, count: board[0].count), count: board.count)
    var queue = [[Int]]()
    var goalI = 0
    var goalJ = 0

    for i in 0 ..< board.count {
        for j in 0 ..< board[0].count {
            let row = Array(board[i])
            if row[j] == "R" {
                queue.append([i,j])
                visited[i][j] = 0
            } else if row[j] == "G" {
                goalI = i
                goalJ = j
            }
        }
    }

    repeat {
        let item = queue.removeFirst()

        // 아래로 Y값을 증가시키며 가봅시다.
        var curI = item[0]
        var curJ = item[1]
        repeat {
            let row = Array(board[curI])
            if row[curJ] == "D" {
                break
            }
            curI += 1
        } while (curI < board.count)
        if visited[curI-1][curJ] > visited[item[0]][item[1]] + 1 {
            visited[curI-1][curJ] = visited[item[0]][item[1]] + 1
            queue.append([curI-1, curJ])
        }

        // 위로
        curI = item[0]
        curJ = item[1]
        repeat {
            let row = Array(board[curI])
            if row[curJ] == "D" {
                break
            }
            curI -= 1
        } while (curI >= 0)
        if visited[curI+1][curJ] > visited[item[0]][item[1]] + 1 {
            visited[curI+1][curJ] = visited[item[0]][item[1]] + 1
            queue.append([curI+1, curJ])
        }

        // 오른쪽으로
        curI = item[0]
        curJ = item[1]
        var row = Array(board[curI])
        repeat {
            if row[curJ] == "D" {
                break
            }
            curJ += 1
        } while (curJ < board[0].count)
        if visited[curI][curJ-1] > visited[item[0]][item[1]] + 1 {
            visited[curI][curJ-1] = visited[item[0]][item[1]] + 1
            queue.append([curI, curJ-1])
        }

        // 왼쪽으로
        curI = item[0]
        curJ = item[1]
        row = Array(board[curI])
        repeat {
            if row[curJ] == "D" {
                break
            }
            curJ -= 1
        } while (curJ >= 0)
        if visited[curI][curJ+1] > visited[item[0]][item[1]] + 1 {
            visited[curI][curJ+1] = visited[item[0]][item[1]] + 1
            queue.append([curI, curJ+1])
        }

    } while (!queue.isEmpty)

    return visited[goalI][goalJ] == Int.max ? -1 : visited[goalI][goalJ]
}