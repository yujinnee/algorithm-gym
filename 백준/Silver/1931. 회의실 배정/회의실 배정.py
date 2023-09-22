num = int(input())
time = list()

for _ in range(num):
  start, end = map(int, input().split())
  time.append([start, end])

time = sorted(time, key=lambda a: a[0]) 
time = sorted(time, key=lambda a: a[1]) 

last = 0 
count = 0 

for i, j in time:
  if i >= last: # 시작시간이 회의의 마지막 시간보다 크거나 같을경우
    count += 1
    last = j

print(count)