def solution(s):
    answer = ''
    arr = list(map(int,s.split()))
    print(arr)
    answer = answer+str(min(arr)) + " "+ str(max(arr))
    return answer