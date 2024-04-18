def solution(s):
    answer = []
    count = 0
    sum = 0
    while s != '1' :
        count += 1
        removedZero = s.replace('0','')
        sum += len(s) - len(removedZero)

        s = format(len(removedZero),'b')
    
    return [count,sum]