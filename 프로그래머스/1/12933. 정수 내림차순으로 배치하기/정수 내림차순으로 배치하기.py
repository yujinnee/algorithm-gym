def solution(n):
    arr = []
    arr = list(map(int,str(n)))
    arr.sort(reverse=True)
    answer = ""
    for a in arr :
        answer = answer + str(a)
    return int(answer)
    