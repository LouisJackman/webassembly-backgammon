.POSIX:

all: assemble-wasm create-embedder

help:
	@echo
	@echo Makefile for WebAssembly Backgammon
	@echo
	@echo '    make                  Make a running backgammon.'
	@echo '    make clean            Clean the built artefacts.'
	@echo '    make run              Build and serve the artefacts over HTTP.'
	@echo '    make assemble-wasm    Just assemble the WebAssembly code.'
	@echo '    make create-embedder  Just create the WebAssembly embedder.'
	@echo '    make serve            Serve the already-built artefacts over HTTP.'
	@echo

clean:
	@if [ -d target ]; \
	then \
		rm -r target; \
	fi

make-target-directory:
	@if [ ! -d target ]; \
	then \
		mkdir target; \
	fi

combine-source-files:
	cat \
		src/imported-globals.wat \
		src/imported-functions.wat \
		src/module-globals.wat \
		src/module-memories.wat \
		src/module-functions.wat \
		src/start.wat \
		>target/main.wat

assemble-wasm: make-target-directory combine-source-files
	wat2wasm -o target/main.wasm target/main.wat

create-embedder: make-target-directory
	cp embedder/embed.js target/main.js
	cp embedder/index.html embedder/style.css target

serve:
	@if ! command -v python3 >/dev/null; \
	then \
		echo Error: Python 3 must be installed to use the serve target. >&2; \
		exit 1; \
	fi

	cd target && python3 -m http.server

run: all serve
