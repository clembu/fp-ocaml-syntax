# Frontend to dune.

ENV = opam config exec --

DUNE_DOC = _build/default/_doc/_html
DOCS_DIR = docs

.PHONY: default build install uninstall test doc clean doc_pages

default: build

build:
	${ENV} dune build

test:
	${ENV} dune runtest -f

install:
	${ENV} dune install

uninstall:
	${ENV} dune uninstall

doc:
	${ENV} dune build @doc

${DOCS_DIR}:
	mkdir ${DOCS_DIR}

doc_pages: ${DOCS_DIR} doc
	rm -rf ${DOCS_DIR}/*
	cp -r ${DUNE_DOC}/* ${DOCS_DIR}/

clean:
	rm -rf docs
	${ENV} dune clean
# Optionally, remove all files/folders ignored by git as defined
# in .gitignore (-X).
# 	git clean -dfXq
