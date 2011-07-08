#
#  The goals is:
#   Count == 0
#   go == a93d3d0a e5b4c597 8652a346 3eb4ddfb 679cbe64 
#   
#   Go is printed as hex but the equivalent representation is 
#   169616110229180197151134821637062180221251103156190100 => a93d3d0ae5b4c5978652a3463eb4ddfb679cbe64
#   
#   where 169 => a9 and 96 is =>3d
#
#   To take a Fixnum into hex:
#   ruby-1.9.2-p0 > 38.to_s(16)
#    => "26" 
#   
#   To get the char equivalent 
#   ruby-1.9.2-p0 > 38.chr
#   => "&"
#
#   Know to split the hash into pairs and get the equivalent string that represents the Fixnum
#   
#    ruby-1.9.2-p0 > str.scan(/../).each { |pair| s << pair.to_i.chr }
#      => ["16", "96", "16", "11", "02", "29", "18", "01", "97", "15", "11", "34", "82", "16", "37", "06", "21", "80", "22", "12", "51", "10", "31", "56", "19", "01", "00"] 
#    ruby-1.9.2-p0 > s
#      "\u0010`\u0010\v\u0002\u001D\u0012\u0001a\u000F\v\"R\u0010%\u0006\u0015P\u0016\f3\n\u001F8\u0013\u0001\u0000"
#
#
#
require 'rubygems'
require 'plist'

#definitions
user = ENV['USER']

#Set the path for the mercury mover plist configuration file
plist_path = "/Users/#{user}/Library/Preferences/com.heliumfoot.MyWiAgent.plist"

#Set the wanted count
count = 0

#This is the desired go bytes
go_bytes = [169, 61, 61, 10, 229, 180, 197, 151, 134 , 82, 163, 70, 62, 180, 221, 251,103,156,190,100]

#Set the wanted go string
go = StringIO.new()

go_bytes.each { |byte|
  go << byte.chr
}


#Translate the file into xml using plutil
%x[plutil  -convert xml1 #{plist_path}]

#know parse the xml
result = Plist::parse_xml(plist_path)

#Set the values
result["count"] = 0
result["go"] = go


#For some reason if the file is not deleted, the old version is still cached or something so delete the file
%x[rm #{plist_path}]

#Create the new file and dump the plist
f = File.open(plist_path, 'w')
f.write(result.to_plist)
f.close()

#convert the plist back to binary
%x[plutil  -convert binary1 #{plist_path}]

