ADD_FILES=$(shell git diff --cached --name-only --diff-filter=ACM -- '*.py')

all:
	for x in $(ADD_FILES); do \
		ruff check $$x; \
	done

check:
	ruff check hello_world/

check-stats:
	ruff check --statistics hello_world/

format:
	black --diff hello_world/*.py

diff:
	ruff --diff hello_world/

fix:
	ruff --fix hello_world/

fix-format:
	black hello_world/*.py

run:
	python hello_world/main.py
