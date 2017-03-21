test: test.native
	@./test.native

test.native: *.ml *.mli *.mly *.mll
	mkdir _build
	menhir --base _build/question question.mly
	@corebuild -use-menhir -r -quiet -pkg oUnit test.native

clean:
	rm -rf _build
	rm -f test.native

.PHONY: clean
