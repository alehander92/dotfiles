function py
	mkdir $argv[1]
	cd $argv[1]
	git init
	echo "#$argv[1]" >  README.md
	subl README.md
	wget https://www.gitignore.io/api/python -O .gitignore
	cp ~/LICENSE .
	touch requirements.txt
	subl requirements.txt
	mkdir bin/
	echo -ne "if __name__ == '__main__':\n    pass\n" >  bin/$argv[1]
	chmod +x bin/$argv[1]
	mkdir $argv[1]/
	mkdir $argv[1]/tests/
	touch $argv[1]/__init__.py
end
