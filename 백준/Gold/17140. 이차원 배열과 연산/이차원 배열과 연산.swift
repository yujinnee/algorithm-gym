import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let r = input[0] - 1
let c = input[1] - 1
let k = input[2]
var array = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 101)
for i in 0..<3 {
    let num = readLine()!.split(separator: " ").map{ Int(String($0))! }
    array[i][0] = num[0]
    array[i][1] = num[1]
    array[i][2] = num[2]
}

var col = 3
var row = 3
var answer = 0

while true {
    if array[r][c] == k {
        print(answer)
        break
    }
    if answer > 100 { //100번 넘어가면 종료
        print(-1)
        break
    }
    
    if col <= row { //R operation
        for i in 0..<row { //행마다
            var dictionary = [Int:Int]()
            for j in 0..<col {
                if array[i][j] == 0 { continue } //0이면 넘어감
                dictionary[array[i][j]] = (dictionary[array[i][j]] ?? 0) + 1
            }
            let sortedDictionary = dictionary.sorted { a, b in //정렬
                if a.value == b.value {
                    return a.key < b.key
                }
                return a.value < b.value
            }
            var index = 0
            for dictionary in sortedDictionary {
                if index >= 99 { break } //100 넘어가면 자름
                array[i][index] = dictionary.key
                index += 1
                array[i][index] = dictionary.value
                index += 1
            }
            col = max(col, index)
            //나머지 0으로 바꾸기
            for j in index..<100 {
                array[i][j] = 0
            }
        }
    } else { //C operation
        for i in 0..<col { //열마다
            var dictionary = [Int:Int]()
            for j in 0..<row {
                if array[j][i] == 0 { continue }
                dictionary[array[j][i]] = (dictionary[array[j][i]] ?? 0) + 1
            }
            let sortedDictionary = dictionary.sorted { a, b in
                if a.value == b.value {
                    return a.key < b.key
                }
                return a.value < b.value
            }
            var index = 0
            for dictionary in sortedDictionary {
                if index >= 99 { break } //100 넘어가면 자름
                array[index][i] = dictionary.key
                index += 1
                array[index][i] = dictionary.value
                index += 1
            }
            row = max(row, index)
            //나머지 0으로 바꾸기
            for j in index..<100 {
                array[j][i] = 0
            }
        }
    }
    answer += 1
}
