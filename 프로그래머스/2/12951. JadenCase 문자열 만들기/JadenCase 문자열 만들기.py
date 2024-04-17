def solution(s):
    answer = ''
    arr = list(s)
    isPrevBlank = True
    for i in range(0,len(arr)) :
        if isPrevBlank:
            answer = answer + arr[i].upper()
        else :
            answer = answer + arr[i].lower()
        
        if arr[i] == " ":
            isPrevBlank = True
        else :
                isPrevBlank = False
    return answer