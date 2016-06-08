ffmpeg -an -f video4linux2 -s 320x240  -r 15 -i /dev/video0 -vcodec mpeg4 -vtag DIVX /tmp/out.avi
