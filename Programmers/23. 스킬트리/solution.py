def solution(skill, skill_trees):
    answer = 0
    
    for skill_tree in skill_trees:
        cur_idx = 0
        success = 1
        for i in skill_tree:
            find_idx = skill.find(i)
            
            if find_idx == -1:
                continue
            elif find_idx != cur_idx:
                cur_idx = -1
                break
            
            cur_idx += 1
            
        if cur_idx != -1:
            answer += 1
            
    return answer