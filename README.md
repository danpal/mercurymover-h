Install
=============
gem install plist
http://www.heliumfoot.com/mercurymover/downloader

Crontab
-------------
crontab -l

# min hour mday month wday command

# Run at the minute 1 every 2 hours
# 1 */2   *   *  * /Users/dani/.rvm/rubies/ruby-1.9.2-p0/bin/ruby /Users/dani/Development/github/mercurymover-h/reset.rb

#run every minute
*/1 * * * *  /Users/dani/.rvm/rubies/ruby-1.9.2-p0/bin/ruby /Users/dani/Development/github/mercurymover-h/reset.rb

