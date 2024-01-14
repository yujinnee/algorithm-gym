from solution import *

def solution(nums):
    answer = 0
    n = len(nums)
    for i in range(0,n-2):
        for j in range(i+1,n-1):
            for k in range(j+1,n):
                sum = nums[i] + nums[j] + nums[k]
                print("합",sum)
                if(isSosu(sum)):
                    answer += 1
    
    

    return answer

def isSosu(num):
    if num == 1 | num == 2:
        return True
    
    for i in range(2,num-1):
        if num%i == 0:
            return False
    
    return True
        