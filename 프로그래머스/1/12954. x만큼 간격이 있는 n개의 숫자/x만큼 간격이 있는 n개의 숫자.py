def solution(x, n):
    num = 0
    answer = []
    for i in range(0,n):
        num = x + num
        answer.append(num)

    return answer