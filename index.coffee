io = require 'socket.io-client'

option = 
	"multiple transports":true
	"max reconnection attempts":500000
	"reconnection delay": 5000
	# "reconnect":false
	"connect timeout":10000
	# "transports":['websocket']

# url = 'http://sihippo.gf.com.cn:80'
url = 'http://183.232.32.100:80'


console.log "connect to #{url}"
socket = io.connect url,option

# 这是请求一个板块的排行数据
data = 
	topic:"quote"
	data:
		flag:0
		msgid:0
		uuid:''
		ver:134
		data:
			fid:4
			rankReq:
				board:2
				count:1
				from:0
				sort:9
				direct:1

socket.on 'connect',->
	console.log "socket connect"
	# sendMsg()

# socket.emit 'message',data

sendMsg = ->
	console.log 'send board quota request...'
	socket.emit 'message',data		

socket.once 'connect',sendMsg 

socket.on 'message',(data)->
	console.log "message from server:#{JSON.stringify(data)}"
	if data.topic is 'quote'
		process.exit()




socket.on 'disconnect',->
	console.log 'socket disconnect'

socket.on 'connecting',(transport)->
	console.log "socket connecting by #{transport}"

socket.on 'connect_failed',->
	console.log "socket connect failed"

socket.on 'close',->
	console.log "socket closed"

socket.on 'reconnect',(transport_type,reconnectionAttempts)->
	console.log "socket reconnected by #{transport_type},at the #{reconnectionAttempts} times"

socket.on 'reconnecting',->
	console.log "socket reconnecting"

socket.on 'reconnect_failed',->
	console.log "socekt reconnect failed"
