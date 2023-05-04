.DEFAULT_GOAL := build
SHELL := /bin/bash
CSSMD5 = $(shell md5sum ./public/css/styles.css | awk '{ print $$1 }')
HUGO_VERSION=0.111.3

build: clean hugo

install:
	mkdir themes
	git clone https://github.com/shapeshed/tufte-catppuccin.git themes/tufte-catppuccin
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

images:
	find ./ -type f -name '*.png' -exec sh -c 'avifenc --min 10 --max 30 $1 "${1%.png}.avif"' _ {} \;
	find ./ -type f -name '*.jpg' -exec sh -c 'avifenc --min 10 --max 30 $1 "${1%.png}.avif"' _ {} \;
	find ./ -type f -name '*.jpeg' -exec sh -c 'avifenc --min 10 --max 30 $1 "${1%.png}.avif"' _ {} \;
	find ./ -type f -name '*.png' -exec sh -c 'cwebp $1 -o "${1%.jpg}.webp"' _ {} \;
	find ./ -type f -name '*.jpg' -exec sh -c 'cwebp $1 -o "${1%.jpg}.webp"' _ {} \;
	find ./ -type f -name '*.jpeg' -exec sh -c 'cwebp $1 -o "${1%.jpg}.webp"' _ {} \;
	find ./static/images/articles -mtime -1 -name '*.png' | xargs optipng -o7 -strip all


minify-html:
	@minify -r --match=\.html public -o .

css:
	@mv ./public/css/styles.css ./public/css/$(CSSMD5).css
	@find ./public -name index.html | xargs sed -i "s/styles\.css/$(CSSMD5)\.css/"

deploy:
	hugo deploy

validate:
	@html5validator --ignore --ignore-re "loading|public/examples*|public/google*|public/y_key*|public/images/articles/index.html" --root public
