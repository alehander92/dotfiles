function mkq
	mkdir $argv[1]
	cd $argv[1]
	git init
	echo "#$argv[1]\n" > README.md
	subl README.md
	echo "*.pyc\n*.o" > .gitignore
	cp ~/LICENSE .
end
