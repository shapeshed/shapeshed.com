.DEFAULT_GOAL := build
SHELL := /bin/bash
CSSMD5 = $(shell md5sum ./public/css/styles.css | awk '{ print $$1 }')
HUGO_VERSION=0.63.0
MINIFY_VERSION=2.5.2

build: clean hugo css minify-html gzip-static

install:
	wget "https://github.com/tdewolff/minify/releases/download/v$(MINIFY_VERSION)/minify_$(MINIFY_VERSION)_linux_amd64.tar.gz"
	tar -xzf minify_$(MINIFY_VERSION)_linux_amd64.tar.gz
	chmod +x minify
	sudo mv minify /usr/local/bin/
	mkdir themes
	git clone https://github.com/shapeshed/shapeshed-minimal.git themes/shapeshed-minimal
	wget -q "https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz"
	tar -xzf hugo_$(HUGO_VERSION)_Linux-64bit.tar.gz
	chmod +x hugo
	sudo mv hugo /usr/local/bin/

clean: 
	@rm -Rf ./public

hugo:
	@hugo

gzip-static:
	@find ./public -type f \( -name "*.html" -o -name "*.css" -o -name "*.xml" \) -exec gzip -n -k -f -9 {} \;

optimize-images:
	find ./static/images/articles -mtime -1 -name '*.png' | xargs optipng -o7 -strip all 

minify-html:
	@minify -r --match=\.html public -o public

css: 
	@mv ./public/css/styles.css ./public/css/$(CSSMD5).css 
	@find ./public -name index.html | xargs sed -i "s/styles\.css/$(CSSMD5)\.css/"

deploy: 
	@rsync -az -e "ssh" --delete ./public/ static1.shapeshed.com:/srv/http/shapeshed.com

validate:
	@html5validator --ignore --ignore-re "public/examples*|public/google*|public/y_key*|public/images/articles/index.html" --root public
