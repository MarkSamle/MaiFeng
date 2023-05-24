import pika

def joinroom(roomid):
    credentials = pika.PlainCredentials('admin', 'admin123..')  # mq用户名和密码
    # 虚拟队列需要指定参数 virtual_host，如果是默认的可以不填。
    connection = pika.BlockingConnection(pika.ConnectionParameters(host = '101.35.8.57',port = 8001,virtual_host = '/',credentials = credentials))
    channel=connection.channel()
    # 声明exchange，由exchange指定消息在哪个队列传递，如不存在，则创建。durable = True 代表exchange持久化存储，False 非持久化存储
    channel.exchange_declare(exchange = 'room',durable = True, exchange_type='direct')

    message='加入房间: ' + str(roomid)
    # 指定 routing_key。delivery_mode = 2 声明消息在队列中持久化，delivery_mod = 1 消息非持久化
    channel.basic_publish(exchange = 'room',routing_key = str(roomid) ,body = message, properties=pika.BasicProperties(delivery_mode = 2))
    connection.close()
    
# joinroom(1)

def change_room_num(roomid,userid):
    credentials = pika.PlainCredentials('admin', 'admin123..')  # mq用户名和密码
    # 虚拟队列需要指定参数 virtual_host，如果是默认的可以不填。
    connection = pika.BlockingConnection(pika.ConnectionParameters(host = '101.35.8.57',port = 8001,virtual_host = '/',credentials = credentials))
    channel=connection.channel()
    # 声明exchange，由exchange指定消息在哪个队列传递，如不存在，则创建。durable = True 代表exchange持久化存储，False 非持久化存储
    channel.exchange_declare(exchange = 'room',durable = True, exchange_type='direct')

    message='{"msg":"room_was_change","user":' + str(userid) + '}'
    # 指定 routing_key。delivery_mode = 2 声明消息在队列中持久化，delivery_mod = 1 消息非持久化
    channel.basic_publish(exchange = 'room',routing_key = str(roomid) ,body = message, properties=pika.BasicProperties(delivery_mode = 2))
    connection.close()
    
def change_room_data(roomid,userid):
    credentials = pika.PlainCredentials('admin', 'admin123..')  # mq用户名和密码
    # 虚拟队列需要指定参数 virtual_host，如果是默认的可以不填。
    connection = pika.BlockingConnection(pika.ConnectionParameters(host = '101.35.8.57',port = 8001,virtual_host = '/',credentials = credentials))
    channel=connection.channel()
    # 声明exchange，由exchange指定消息在哪个队列传递，如不存在，则创建。durable = True 代表exchange持久化存储，False 非持久化存储
    channel.exchange_declare(exchange = 'room',durable = True, exchange_type='direct')

    message='{"msg":"code_was_change","user":' + str(userid) + '}'
    # 指定 routing_key。delivery_mode = 2 声明消息在队列中持久化，delivery_mod = 1 消息非持久化
    channel.basic_publish(exchange = 'room',routing_key = str(roomid) ,body = message, properties=pika.BasicProperties(delivery_mode = 2))
    connection.close()

def update_room_msg(roomid,userid):
    credentials = pika.PlainCredentials('admin', 'admin123..')  # mq用户名和密码
    # 虚拟队列需要指定参数 virtual_host，如果是默认的可以不填。
    connection = pika.BlockingConnection(pika.ConnectionParameters(host = '101.35.8.57',port = 8001,virtual_host = '/',credentials = credentials))
    channel=connection.channel()
    # 声明exchange，由exchange指定消息在哪个队列传递，如不存在，则创建。durable = True 代表exchange持久化存储，False 非持久化存储
    channel.exchange_declare(exchange = 'room',durable = True, exchange_type='direct')

    message='{"msg":"update_room_msg","user":' + str(userid) + '}'
    # 指定 routing_key。delivery_mode = 2 声明消息在队列中持久化，delivery_mod = 1 消息非持久化
    channel.basic_publish(exchange = 'room',routing_key = str(roomid) ,body = message, properties=pika.BasicProperties(delivery_mode = 2))
    connection.close()