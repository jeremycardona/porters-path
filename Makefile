.PHONY: install build serve clean

install:
	bundle install
	npm install

build:
	npm run build

serve:
	npm run dev

clean:
	npm run clean