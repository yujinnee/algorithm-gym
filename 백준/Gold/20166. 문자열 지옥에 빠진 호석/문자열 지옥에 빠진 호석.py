N,M,K =list(map(int,input().split()))
Map = []
ans ={}

for _ in range(N):
       Map.append(list(input()))

dir = [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]]


def dfs(x,y,word):
       ans[word] = ans.get(word,0)+1 
       #리스트.get(원하는것 ,b) =>원하는게 있을시 리턴 없을시 b출력
       if len(word) == 5:
              return 
       for i in range(8):
              dir_x =(x + dir[i][0])%N
              dir_y =(y + dir[i][1])%M
              #환영 좌표계 구현
              dfs(dir_x,dir_y,word+Map[dir_x][dir_y])
              #재귀를 통해 dfs 완성

#존재하는 모든 좌표의 모든경우의수 대입을위해 for /for 문으로 모든 경우의수 적용

for i in range(N):
    for j in range(M):
        dfs(i, j, Map[i][j])

# 각각의 경우의수를 가지고 있는 것들중 일치하는것의 갯수 도출

for _ in range(K):
   print(ans.get(input().rstrip(), 0))