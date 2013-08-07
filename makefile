DEPS := $(wildcard cards/*)
LIBRARY=build/library.lbr
TESTDIR=test

.PHONY: test all change edit unpack tools clean

all: ${LIBRARY}

${LIBRARY}: $(DEPS)
	@mkdir -p $(dir ${LIBRARY})
	librator cards/ ${LIBRARY}

test: ${LIBRARY}
	greencard $< -t ${TESTDIR}

edit: ${LIBRARY}
	curator $<

unpack: ${LIBRARY}
	librator -u cards/ $<

change: edit unpack

tools:
	pip install -r requirements.txt

clean:
	rm ${LIBRARY}
