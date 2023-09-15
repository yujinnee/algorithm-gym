n,l = list(map(int,input().split()))
arr = list(map(int,input().split()))

arr.sort()
start = arr[0]
end = start + l-1
count = 1
for a in arr:
    if(a>end):
        count += 1
        start = a
        end = a+l-1
print(count)

