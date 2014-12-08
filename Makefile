build: blocklist.txt
	git checkout gh-pages
	git add blocklist.txt
	git commit -m "built from $(shell git rev-parse master)"
	git checkout master

blocklist.txt: filters.txt meta.txt
	perl generate.pl > blocklist.txt
