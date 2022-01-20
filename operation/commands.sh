#Check ubuntu version
cat /etc/issue
#List out all packages installed in System
dpkg-query -l
#Find the crontab in instance
crontab -e
#Kill process with kill -9
kill -SIGKILL [pid] | kill -9 [pid] | kill -9 $(ps aux | grep [name] | awk '{print $2}')
#Find PID(process id)
ps -aux
