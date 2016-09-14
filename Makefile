SHELL := /bin/bash
CSSMD5 = $(shell md5sum ./public/css/styles.css | awk '{ print $$1 }')

build: clean hugo css gzip-static

clean: 
	@rm -Rf ./public

hugo:
	@hugo

gzip-static:
	@find . -type f \( -name "*.html" -o -name "*.css" \) -exec gzip -k -f -9 {} \;



css: 
	@mv ./public/css/styles.css ./public/css/$(CSSMD5).css 
	@find ./public -name index.html | xargs sed -i "s/styles\.css/$(CSSMD5)\.css/"

rsync: 
	@rsync -az -e "ssh" --delete ./public/ 173.255.248.188:/srv/http/shapeshed.com
