import os
server_list = ['10.0.0.2','10.0.0.3','10.0.0.5','10.0.0.6','10.0.0.8','10.0.0.7','10.0.0.10','10.0.0.12']
f = open('rsy_enzyme.bash','w')
s = '''#!/bin/bash

inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w%f%e' -e modify,create,attrib --fromfile rsyfile \
| while read files
do
'''
excludes = [
    "'gcn/checkpoints'",
    "'gcn/log/'",
    "'gcn/result/'",
    "'.*swp'",
    "'.*ipynb'",
    "'gcn/nohup.out'",

]
for server in server_list:
    s+= "rsync -vzrtopg --progress "
    for exclude in excludes:
        s+=' --exclude '+exclude
    s+=" ../enzyme/ "+server+":~/enzyme/ " + '\n'
s+='echo "${files} was rsynced" >>/tmp/rsync.log 2>&1\ndone'

f.write(s)
f.close()
