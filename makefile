DEPS := $(wildcard cards/*)

.PHONY: test

all: build/library.lbr

build/library.lbr: $(DEPS)
	@mkdir -p build
	librator cards/ build/library.lbr

test: build/library.lbr
	greencard $<
