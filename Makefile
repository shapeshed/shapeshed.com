.DEFAULT_GOAL := build
SHELL := /bin/bash
CSSMD5 = $(shell md5sum ./public/css/styles.css | awk '{ print $$1 }')

build: clean hugo css minify-html gzip-static

install:
	wget "https://github.com/tdewolff/minify/releases/download/v2.7.0/minify_2.7.0_linux_amd64.tar.gz"
	tar -xzf minify_2.7.0_linux_amd64.tar.gz
	chmod +x minify
	sudo mv minify /usr/local/bin/
	mkdir themes
	git clone https://github.com/shapeshed/shapeshed-minimal.git themes/shapeshed-minimal
	wget -q "https://github.com/gohugoio/hugo/releases/download/v0.62.2/hugo_0.62.2_Linux-64bit.tar.gz"
	tar -xzf hugo_0.62.2_Linux-64bit.tar.gz
	chmod +x hugo
	sudo mv hugo /usr/local/bin/

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
