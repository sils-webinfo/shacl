SHELL := /usr/bin/env bash

.PHONY: superclean validate

superclean:
	$(MAKE) -s -C tools/jena clean

tools/jena/bin/shacl \
tools/jena/bin/shex :
	which java || \
	(sudo apt update && sudo apt -y install default-jre)
	$(MAKE) -s -C tools/jena

validate: tools/jena/bin/shacl
	./tools/jena/bin/shacl validate --shapes shapes.ttl --data data.ttl
