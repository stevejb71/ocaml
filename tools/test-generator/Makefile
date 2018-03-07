default: clean test

install: build
	cp _build/default/test_gen.exe .

build:
	jbuilder build test_gen.exe

test: 
	jbuilder runtest

clean:
	jbuilder clean

.PHONY: clean
