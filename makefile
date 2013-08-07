DEPS := $(wildcard cards/*)
LIBRARY=build/library.lbr

.PHONY: test all change edit unpack tools clean

all: ${LIBRARY}

${LIBRARY}: $(DEPS)
	@mkdir -p build
	librator cards/ ${LIBRARY}

test: ${LIBRARY}
	greencard $<

edit: ${LIBRARY}
	curator $<

unpack: ${LIBRARY}
	librator -u cards/ $<

change: edit unpack

tools:
	pip install -r requirements.txt

clean:
	rm ${LIBRARY}
