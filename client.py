import os
server_list = ['10.0.0.2','10.0.0.3','10.0.0.5','10.0.0.6','10.0.0.8','10.0.0.10','10.0.0.12']
for server in server_list:
    rsy  = "rsync -vzrtopg --progress /home/shuhantao/enzyme/gcn/result/ 10.0.0.4:/home/shuhantao/enzyme/gcn/result/"
    s = '(echo "*/5 * * * * '+rsy +'"; crontab -l )| crontab'
    print('ssh '+server +'  \''+s+'\'')
    os.system('ssh '+server +'  \''+s+'\'')

