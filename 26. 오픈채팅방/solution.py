def solution(record):
    answer = []
    
    dic = {}
    
    for message in record:
        message = message.split(' ')
        
        action = message.pop(0)
        uid = message.pop(0)
        if message:
            name = message.pop(0)
        
        if action == "Enter" or action == "Change":
            dic[uid] = name
    
    for message in record:
        message = message.split(' ')
        
        action = message.pop(0)
        uid = message.pop(0)
        
        if action == "Enter":
            answer.append(dic[uid] + "님이 들어왔습니다.")
        elif action == "Leave":
            answer.append(dic[uid] + "님이 나갔습니다.")
        
    return answer