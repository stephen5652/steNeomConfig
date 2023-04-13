#!/bin/bash
#
install_tool() {
	echo -e "homebrew install tools\n"

	brew install wget nodejs yarn
	npm config set registry http://registry.npmmirror.com
	yarn config set registry http://registry.npmmirror.com

	echo -e "\nhomebrew install tools finish"
}

install_plugin_implementations() {
	echo -e "Start install nvim plugin implentations\n"
	brew install lazygit
	# plugins for telescope, nvim command: checkhealth telescope
	brew install ripgrep
	brew install fd

	echo -e "Finish install nvim plugins implementations\n"
}

install_dap_debug() {
	echo -e "\nbeging install dap debug\n"

	# codelldb
	echo "install codelldb"
	rm -rf ~/.local/share/nvim/data/debug/tools
	mkdir -pv ~/.local/share/nvim/data/debug/tools
	wget https://github.com/vadimcn/codelldb/releases/download/v1.9.0/codelldb-x86_64-darwin.vsix -P ~/Downloads
	unzip -d ~/.local/share/nvim/data/debug/tools/ ~/Downloads/codelldb-x86_64-darwin.vsix

	echo -e "\nhomebrew install dap debug finish\n"
}

main() {
	install_tool
	install_plugin_implementations
	install_dap_debug
}

main
