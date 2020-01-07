yum -y install openssh-server
useradd remote_user && \
    echo "1234" | passwd remote_user  --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

remote-key.pub /home/remote_user/.ssh/authorized_keys

chown remote_user:remote_user   -R /home/remote_user && \
chmod 600 /home/remote_user/.ssh/authorized_keys

/usr/sbin/sshd-keygen
/usr/sbin/sshd -D
