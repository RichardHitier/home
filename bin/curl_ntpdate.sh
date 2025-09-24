sudo date -s "$(curl -sD - google.com | grep '^Date:' | cut -d' ' -f3-6)Z"
echo '0 0 * * * date -s "$(curl -sD - google.com | grep '"'"'^Date:'"'"' | cut -d'"'"' '"'"' -f3-6)Z"'  > ntp.cronjob
sudo crontab ntp.cronjob
sudo crontab -l
rm ntp.cronjob

# vim: tw=0
