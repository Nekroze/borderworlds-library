DEPS := $(wildcard cards/*)
BUILDDIR=build/
LIBRARY=${BUILDDIR}library.lbr
TESTDIR=test

.PHONY: test all change edit unpack tools clean style check deps wipe

all: ${LIBRARY}

${LIBRARY}: $(DEPS)
	@mkdir -p ${BUILDDIR}
	librator cards/ ${LIBRARY}

test: ${LIBRARY}
	greencard $< -t ${TESTDIR}

edit: ${LIBRARY}
	curator $<

unpack: ${LIBRARY}
	librator -u cards/ $<

change: edit unpack

tools: deps
	pip install -r tools.txt

deps:
	pip install -r requirements.txt

clean:
	rm -rf ${BUILDDIR}

style:
	flake8 test/

check: style test

wipe: clean
	rm -f cards/*.crd
