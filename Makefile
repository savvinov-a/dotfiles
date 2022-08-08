# default
.PHONY: install

# install my configs
install:
	@echo "INSTALLING"
	ln -sf $(PWD)/nvim/lua/ $(HOME)/.config/nvim/lua
	ln -sf $(PWD)/init.vim $(HOME)/.config/nvim/init.vim
	ln -sf $(PWD)/vimrc $(HOME)/.vimrc
	ln -sf $(PWD)/zshrc $(HOME)/.zshrc
	ln -sf $(PWD)/tmux.conf $(HOME)/.tmux.conf
	ln -sf $(PWD)/ideavimrc $(HOME)/.ideavimrc

mybrew:
	@echo "install"
	brew install fish
