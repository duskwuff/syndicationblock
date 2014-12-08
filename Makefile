build:
	perl generate.pl > blocklist.tmp.txt
	git checkout gh-pages
	mv blocklist.tmp.txt blocklist.txt
	git add blocklist.txt
	git commit -m "built from $(shell git rev-parse master)"
	git checkout master
