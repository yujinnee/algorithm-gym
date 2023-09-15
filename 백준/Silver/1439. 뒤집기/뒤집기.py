arr = input()
zero_count = 0
one_count = 0

if arr[0] == "0" :
    zero_count += 1
else:
    one_count += 1

flag = arr[0]

for i in range(1,len(arr)):
 if flag != arr[i]:
    if arr[i] == "0":
         zero_count += 1
         flag = "0"
    else :
        one_count += 1
        flag = "1"
                


print(zero_count) if zero_count<one_count else print(one_count)


    