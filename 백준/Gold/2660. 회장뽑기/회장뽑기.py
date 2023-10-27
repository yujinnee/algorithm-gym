import sys
from collections import deque, defaultdict

def bfs(start):
    queue = deque([[start, 0]])
    while queue:
        u, dist = queue.popleft()
        for v in member[u]:
            if not visited[v]:
                queue.append([v, dist+1])
                visited[v] = dist+1

def get_max_dist():
    max_dist = float('-inf')
    for dist in visited:
        if dist > max_dist:
            max_dist = dist
    return max_dist

n = int(sys.stdin.readline().strip())

member = [[] for _ in range(n+1)]

while True:
    mem1, mem2 = map(int, input().split())
    if mem1 == mem2 == -1:
        break
    member[mem1].append(mem2)
    member[mem2].append(mem1)
    

result = defaultdict(int) # result = {회장후보: 점수}
for i in range(1, n+1):
    visited = [0 for _ in range(n+1)]
    visited[i] = 1
    bfs(i)
    result[i] = get_max_dist()

min_dist = min(result.values())
candis = [i for i, dist in result.items() if dist == min_dist]

print(min_dist, len(candis))
print(*candis) # 이미 입력순으로 정렬되어 있음