let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        var graph = [Int: [Int]]() // 비교하는 학생에 대한 정보
        
        var indegree = [Int](repeating: 0, count: input[0]+1) // 진입차수 정보
        indegree[0] = -1 // index를 학생번호로 쓰기 위함.
        
        for _ in 0..<input[1] {
            let info = readLine()!.split(separator: " ").map { Int(String($0))! }
            
            if graph[info[0]] == nil {
                graph[info[0]] = [info[1]]
            } else {
                graph[info[0]]!.append(info[1])
            }
            
            indegree[info[1]] += 1
        }
        
//        print(graph)
//        print(indegree)
        
        var queue = [Int]()
        indegree.enumerated().forEach {
            if $0.element == 0 {
                queue.append($0.offset)
            }
        }
//        print(queue)
        
        
        var result = [Int]()
        // 큐가 빌때까지
        
//        var index = 0
        while !queue.isEmpty {
//            let now = queue[index]
            queue.sort(by: <)
            let now = queue.removeFirst()
//            index += 1
            result.append(now)
            
            // 해당원소와 연결된 노드들의 진입차수에서 -1
            if let sequence = graph[now] {
                for i in sequence{
                    indegree[i] -= 1
                    
                    if indegree[i] == 0 {
                        queue.append(i)
                    }
                }
            }
            
        }
        
        //        print(result)
        print(result.reduce(into: "", { $0 += "\($1) "}).dropLast())