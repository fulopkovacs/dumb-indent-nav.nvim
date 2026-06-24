.PHONY: test

PLENARY := /Users/fulopkovacs/.local/share/nvim/lazy/plenary.nvim

test:
	nvim --headless --clean -u NONE \
		-c "set rtp+=$(PLENARY)" \
		-c "set rtp+=." \
		-c "lua require('plenary.test_harness').test_directory('spec', { minimal_init = 'NONE' })"
