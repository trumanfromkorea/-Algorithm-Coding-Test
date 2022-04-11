def check_pairs(B):
    check = []
    brackets = B.copy()
    
    while brackets:
        pop = brackets.pop(0)
        
        if pop == '(' or pop == '{' or pop == '[':
            check.append(pop)
        elif pop == ')' and check:
            opened = check.pop()
            if opened != '(':
                return False
        elif pop == '}' and check:
            opened = check.pop()
            if opened != '{':
                return False
        elif pop == ']' and check:
            opened = check.pop()
            if opened != '[':
                return False
        else:
            return False
    
    if check:
        return False
    
    return True
    
def solution(s):
    answer = 0
    
    brackets = list(s)
    
    for i in range(len(brackets)):
        
        if check_pairs(brackets):
            answer += 1
        
        brackets.append(brackets.pop(0))
    
    return answer