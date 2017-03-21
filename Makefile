all: create-symlinks
clean: remove-symlinks

create-symlinks: remove-symlinks
	./make.pl create-symlinks

remove-symlinks:
	./make.pl remove-symlinks
