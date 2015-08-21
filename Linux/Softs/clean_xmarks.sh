# 0. backup your current bookmars
# 1. Deactivate Xmarks extension
# 2. close firefox 
# pkill -15 firefox
# 3. remove problematic files
rm -f .mozilla/firefox/rd2olt63.default/xmarks.log .mozilla/firefox/rd2olt63.default/xmarks.sqlite

# 4. run firefox and re-activate Xmarks extension
# 5. restart firefox
# 6. re-activate xmarks extension
# 7. Attempt to sync again

# If it still does not work:
# 3'. rm -f .mozilla/firefox/rd2olt63.default/xmarks-baseline-*
# 6'. download from server
# 7'. recover locally backuped bookmarks
