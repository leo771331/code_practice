def solution(n, s):
    if s < n:
            return [-1]
        
    quotient, remainder = divmod(s, n)
    answer = [quotient] * (n - remainder) + [quotient + 1] * remainder
    return answer