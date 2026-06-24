.PHONY: test format format-check docgen clean

PLENARY ?= $(HOME)/.local/share/nvim/lazy/plenary.nvim

test:
	nvim --headless --clean -u NONE \
		-c "set rtp+=$(PLENARY)" \
		-c "set rtp+=." \
		-c "lua require('plenary.test_harness').test_directory('spec', { minimal_init = 'NONE' })"

format:
	git ls-files '*.lua' | xargs lua-format -i -c .lua-format

format-check:
	$(MAKE) format
	git diff --exit-code

.deps/docgen.nvim:
	mkdir -p .deps
	git clone --depth 1 --branch v1.1.0 https://github.com/jamestrew/docgen.nvim $@

docgen: .deps/docgen.nvim
	nvim -l scripts/gendoc.lua
	nvim --headless --clean -u NONE -c "helptags doc" -c "qa"

clean:
	rm -rf .deps
