def solution(numbers):
    answer = -1
    array = [0,1,2,3,4,5,6,7,8,9]
    for num in numbers :
        array.remove(num)
    return sum(array)