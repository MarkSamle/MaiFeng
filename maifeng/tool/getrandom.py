import random
import string

# 随机码生成脚本
def getcode(id):
    try:
        data = ''
        a = int(random.choice('123456789'))
        b = int(random.choice('123456789'))
        c = int(random.choice('123456789'))
        d = int(random.choice('123456789'))
        data1 = ''.join(random.sample(string.ascii_letters + string.digits, c*a))
        data2 = ''.join(random.sample(string.ascii_letters + string.digits, d*b))
        for i in range(0,a):
            data = data  + random.choice('!@#$%^&*()-+`~,.=')
        for i in range(0,b):
            head = random.randint(0xb0, 0xf7)
            body = random.randint(0xa1, 0xfe)
            val = f'{head:x} {body:x}'
            data = data  + bytes.fromhex(val).decode('gbk')
        data = data1 + str(id) + data + str(id) + data2
        return data
    except:
        return ''
    
    
    
def guess(id):
    data = getcode(id)
    while data == '' or len(data) > 225:
        data = getcode(id)
    return data

# print(guess(5))