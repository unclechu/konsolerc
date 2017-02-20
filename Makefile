all: create-symlinks
clean: remove-symlinks

DIR := `pwd`

create-symlinks: remove-symlinks
	(cd ~/.config/ && ln -s "$(PWD)/konsolerc")
	mkdir -p ~/.local/share/konsole/
	(cd ~/.local/share/konsole/ && ln -s "$(PWD)/konsole/dark.profile")
	(cd ~/.local/share/konsole/ && ln -s "$(PWD)/konsole/light.profile")
	(cd ~/.local/share/konsole/ && \
		ln -s "$(PWD)/konsole/my dark theme.colorscheme")
	(cd ~/.local/share/konsole/ && \
		ln -s "$(PWD)/konsole/my light theme.colorscheme")

remove-symlinks:
	(cd ~/.config/ && \
		[ -L konsolerc -o ! -e konsolerc ] && \
		rm -f konsolerc)
	(cd ~/.local/share/ && \
		[ -L konsole/dark.profile -o ! -e konsole/dark.profile ] && \
		rm -f konsole/dark.profile)
	(cd ~/.local/share/ && \
		[ -L konsole/light.profile -o ! -e konsole/light.profile ] && \
		rm -f konsole/light.profile)
	(cd ~/.local/share/ && \
		[ -L 'konsole/my dark theme.colorscheme' \
			-o ! -e 'konsole/my dark theme.colorscheme' ] && \
		rm -f 'konsole/my dark theme.colorscheme')
	(cd ~/.local/share/ && \
		[ -L 'konsole/my light theme.colorscheme' \
			-o ! -e 'konsole/my light theme.colorscheme' ] && \
		rm -f 'konsole/my light theme.colorscheme')
