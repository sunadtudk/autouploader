
# Install (Ubuntu /debian) :  
# apt-get -y install rsync inotify-tools lftp screen
# screen is for background running: 
#Events:
#        access          file or directory contents were read
#        modify          file or directory contents were written
#        attrib          file or directory attributes changed
#        close_write     file or directory closed, after being opened in
#                        writable mode
#        close_nowrite   file or directory closed, after being opened in
#                        read-only mode
#        close           file or directory closed, regardless of read/write mode
#        open            file or directory opened
#        moved_to        file or directory moved to watched directory
#        moved_from      file or directory moved from watched directory
#        move            file or directory moved to or from watched directory
#        create          file or directory created within watched directory
#        delete          file or directory deleted within watched directory
#        delete_self     file or directory was deleted
#        unmount         file system containing file or directory unmounted
##FTP upload!! Bash style 
##  Add this to a crontab.
#!/bin/bash
while true; do
  inotifywait -r -e modify,attrib,close_write,move,create,delete /home/[user]/data
lftp ftp://[ftp-user]:[ftp-password]@ftp.Server.com << EOF
mirror -R --use-cache /home/[user]/data/ /ftp/testremote/
quit 0
EOF
done
