#!/bin/bash

inotifywait -mr --timefmt '%d/%m/%y %H:%M' --format '%T %w%f%e' -e modify,create,attrib --fromfile rsyfile \
| while read files
do
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.2:~/enzyme/ 
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.3:~/enzyme/ 
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.5:~/enzyme/ 
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.6:~/enzyme/ 
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.7:~/enzyme/ 
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.8:~/enzyme/ 
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.10:~/enzyme/ 
rsync -vzrtopg --progress --exclude 'gcn/checkpoints' --exclude 'gcn/log/' --exclude '*result*' --exclude '.*swp' --exclude '.*ipynb' ../enzyme/ 10.0.0.12:~/enzyme/ 

echo "${files} was rsynced" >>/tmp/rsync.log 2>&1
done
