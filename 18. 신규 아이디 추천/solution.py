def solution(new_id):
    answer = ''
    
    new_id = new_id.lower()
    
    string = []
    for c in new_id:
        if c.isdigit() or c.isalpha() or c == '-' or c == '_' or c=='.':
            string.append(c)
            
    string_2 = []
    idx = string.pop(0)
    string_2.append(idx)
    for c in string:
        if string_2[-1] == '.' and c =='.':
            continue
        string_2.append(c)
    
    if string_2 and string_2[0] == '.':
        string_2.pop(0)
    if string_2 and string_2[-1] == '.':
        string_2.pop()
    
    if not string_2:
        string_2.append("a")

    string_2 = string_2[:15]

    if string_2[-1] == '.':
        string_2.pop()
        
    while len(string_2) < 3:
        string_2.append(string_2[-1])
    
    
    return ''.join(string_2)