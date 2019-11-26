.DEFAULT_GOAL := build
SHELL := /bin/bash
CSSMD5 = $(shell md5sum ./public/css/styles.css | awk '{ print $$1 }')

build: clean hugo css minify-html gzip-static validate

install:
	wget "https://github.com/tdewolff/minify/releases/download/v2.5.2/minify_2.5.0_linux_amd64.tar.gz"
	tar -xvzf minify_2.5.2_linux_amd64.tar.gz
	wget "https://github.com/gohugoio/hugo/releases/download/v0.59.1/hugo_0.59.1_Linux-64bit.tar.gz"
	tar -xvzf hugo_0.59.1_Linux-64bit.tar.gz

clean: 
	@rm -Rf ./public

hugo:
	@hugo --quiet

gzip-static:
	@find ./public -type f \( -name "*.html" -o -name "*.css" -o -name "*.xml" \) -exec gzip -n -k -f -9 {} \;

minify-html:
	@minify -r --match=\.html public -o public

optimize-images:
	find ./static/images/articles -mtime -1 -name '*.png' | xargs optipng -o7 -strip all 

css: 
	@mv ./public/css/styles.css ./public/css/$(CSSMD5).css 
	@minify ./public/css/$(CSSMD5).css -o public/css/$(CSSMD5).css
	@find ./public -name index.html | xargs sed -i "s/styles\.css/$(CSSMD5)\.css/"

deploy: 
	@rsync -az -e "ssh" --delete ./public/ static1.shapeshed.com:/srv/http/shapeshed.com

validate:
	@validatornu public/*/index.html
