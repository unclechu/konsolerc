all: create-symlinks
clean: remove-symlinks

create-symlinks: remove-symlinks
	(cd ~/.config/ && ln -s "$(shell pwd)/konsolerc")
	mkdir -p ~/.local/share/konsole/
	(cd ~/.local/share/konsole/ && ln -s "$(shell pwd)/konsole/dark.profile")
	(cd ~/.local/share/konsole/ && ln -s "$(shell pwd)/konsole/light.profile")
	(cd ~/.local/share/konsole/ && \
		ln -s "$(shell pwd)/konsole/my dark theme.colorscheme")
	(cd ~/.local/share/konsole/ && \
		ln -s "$(shell pwd)/konsole/my light theme.colorscheme")

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
