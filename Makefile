SHELL := /bin/bash
CSSMD5 = $(shell md5sum ./public/css/styles.css | awk '{ print $$1 }')

build: clean hugo css minify-html gzip-static

clean: 
	@rm -Rf ./public

hugo:
	@hugo

gzip-static:
	@find ./public -type f \( -name "*.html" -o -name "*.css" -o -name "*.xml" \) -exec gzip -k -f -9 {} \;

minify-html:
	@minify -r --match=\.html public


css: 
	@mv ./public/css/styles.css ./public/css/$(CSSMD5).css 
	@minify ./public/css/$(CSSMD5).css
	@find ./public -name index.html | xargs sed -i "s/styles\.css/$(CSSMD5)\.css/"

rsync: 
	@rsync -az -e "ssh" --delete ./public/ static1.shapeshed.com:/srv/http/shapeshed.com
