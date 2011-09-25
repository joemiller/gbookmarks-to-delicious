#!/usr/bin/env ruby
#
# http://www.google.com/bookmarks/?output=xml&num=20000
#

require 'nokogiri'

if ARGV[0].nil?
  puts "Usage: #{$0} google-bookmarks.xml"
  puts
  puts "Visit 'http://www.google.com/bookmarks/?output=xml&num=20000' in your browser"
  puts "for an XML export of your bookmarks."
  exit 1
end

gbooks = Nokogiri::XML( File.open(ARGV[0]) )

puts <<-EOT
<!DOCTYPE NETSCAPE-Bookmark-file-1>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
<!-- This is an automatically generated file.
It will be read and overwritten.
Do Not Edit! -->
<TITLE>Bookmarks</TITLE>
<H1>Bookmarks</H1>
<DL><p>
EOT

gbooks.xpath("//bookmark").each do |bookmark|
  title = bookmark.xpath('title').text
  url = bookmark.xpath('url').text
  timestamp = bookmark.xpath('timestamp').text
  timestamp = timestamp.to_i / 1000000
  
  tags = []
  bookmark.xpath('labels/label').each do |label|
    tags << label.text
  end
  
  puts <<-EOT
    <DT><A HREF="#{url}" ADD_DATE="#{timestamp}" PRIVATE="1" TAGS="#{tags.join(',')}">#{title}</A>
  EOT
end

puts "</DL>"