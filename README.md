Google Bookmarks to Del.icio.us
===============================

This is a simple script for converting Google Bookmark's XML export into Del.icio.us's import format, including all tag information.

Normally, you would use Google Bookmark's HTML Export function from the UI, then import that file into del.icio.us. But this will process will only import one tag per bookmark.  Instead, use this script to correctly import all tags from each bookmark.

Pre-Reqs
--------
* Nokogiri gem

Usage
-----

1. Visit http://www.google.com/bookmarks/?output=xml&num=20000 in your browser (you need to be logged in to your google account), save the output to gbooks.xml

2. Run the XML file through the script, eg:

	$ ./gbooks2delicious.rb gbooks.xml >delicious.html
	
3. Import delicious.html to your del.icio.us account.

Resources
---------

Thanks to http://www.mmartins.com/mmartins/googlebookmarksapi/ for info on the XML export "API" from google bookmarks.

Author
------
joe miller, <joeym@joeym.net>.  http://joemiller.me