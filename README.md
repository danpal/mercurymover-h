About
====

mercurymover-h is a mercury mover registration system hack to reset the usage count to
100

Installation
------------

gem install plist
http://www.heliumfoot.com/mercurymover/downloader

Crontab
-------------

Use crontab to run the scrip on hourly bases or as needed.
<pre><code>
$crontab -l

#min hour mday month wday command

#Run at the minute 1 every 2 hours
#1 */2   *   *  * ruby /Users/dani/Development/github/mercurymover-h/reset.rb

#run every minute
*/1 * * * *  ruby /Users/dani/Development/github/mercurymover-h/reset.rb

</code></pre>
