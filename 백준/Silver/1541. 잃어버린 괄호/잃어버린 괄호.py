# 테케만 맞는 코드
expression = input()

num = ""
add_nums = list()
minus_nums = list()


isFoundMinus = False
for e in expression :
    if e == "-":
        if isFoundMinus:
            minus_nums.append(int(num))
            num = ""
        else:
            isFoundMinus = True
            add_nums.append(int(num))
            num = ""
    elif e == "+":  
        if isFoundMinus:
            minus_nums.append(int(num))
            num = ""
        else :
            add_nums.append(int(num))
            num = ""
    else :
        num=num+e

if isFoundMinus:
    minus_nums.append(int(num))
else:
    add_nums.append(int(num))

print(sum(add_nums)-sum(minus_nums)) 