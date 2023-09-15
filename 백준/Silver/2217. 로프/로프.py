from collections import Counter
n = int(input())
arr = list()
min = 987654321

for _ in range(0,n):
    num = int(input())
    if num<min:
        min = num
    arr.append(num)

counterDic = Counter(arr)
d1 = sorted(counterDic.items(),reverse=True)

arr1 = list()

max = 0
count = 0
for key,value in d1:
    count += value
    if max<key*count:
        max = key*count
    
print(max)
