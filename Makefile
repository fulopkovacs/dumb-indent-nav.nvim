.PHONY: test docgen clean

PLENARY := /Users/fulopkovacs/.local/share/nvim/lazy/plenary.nvim

test:
	nvim --headless --clean -u NONE \
		-c "set rtp+=$(PLENARY)" \
		-c "set rtp+=." \
		-c "lua require('plenary.test_harness').test_directory('spec', { minimal_init = 'NONE' })"

.deps/docgen.nvim:
	mkdir -p .deps
	git clone --depth 1 --branch v1.1.0 https://github.com/jamestrew/docgen.nvim $@

docgen: .deps/docgen.nvim
	nvim -l scripts/gendoc.lua

clean:
	rm -rf .deps
