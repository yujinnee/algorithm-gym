def solution(s):
    answer = True
    
    arr = list(s)

    stack = []
    for a in arr :
        if a == "(":
            stack.append("(")
        else:
            if len(stack) == 0:
                return False
            top = stack.pop()
            if top == "(":
                continue
            else :
                return False
        


    return len(stack) == 0 