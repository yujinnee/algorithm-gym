def solution(t, p):
    answer = 0
    wordLen = len(p)
    start = 0 
    end = start + wordLen
    for i in range(0,len(t)-wordLen+1):
        word = t[start:end]
        if int(word)<=int(p):
            answer += 1
        start += 1
        end += 1
    return answer