DEPS := $(wildcard cards/*)

.PHONY: test all change edit unpack tools

all: build/library.lbr

build/library.lbr: $(DEPS)
	@mkdir -p build
	librator cards/ build/library.lbr

test: build/library.lbr
	greencard $<

edit: build/library.lbr
	curator $<

unpack: build/library.lbr
	librator -u cards/ $<

change: edit unpack

tools:
	pip install -r requirements.txt
