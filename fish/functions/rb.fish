function rb
	mkdir $argv[1]
	cd $argv[1]
	git init
	echo "#$argv[1]" >  README.md
	subl README.md
	wget https://www.gitignore.io/api/ruby -O .gitignore
	cp ~/LICENSE .
	echo "source \"https://rubygems.org\"" > Gemfile
	echo >> Gemfile
	echo "gem 'rspec', group: [:development, :test]" >> Gemfile
	subl Gemfile
	cp ~/Rakefile .
	set argc (count $argv)
	if math "$argc > 1"; expr $argv[2] == "b"
	  mkdir bin/
	  echo "#!/usr/bin/env ruby" > bin/$argv[1]
	  echo "\$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'" >> bin/$argv[1]
	  echo  "require '$argv[1]'" >> bin/$argv[1]
      chmod +x bin/$argv[1]
	end

	mkdir lib/
	touch lib/$argv[1].rb
	mkdir lib/$argv[1]
	subl lib/$argv[1].rb
	mkdir spec/
	echo "\$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))" > spec/spec_helper.rb
	echo "\$LOAD_PATH.unshift(File.dirname(__FILE__))" >> spec/spec_helper.rb
	echo "require 'rspec'" >> spec/spec_helper.rb
	echo "require '$argv[1]'" >> spec/spec_helper.rb
	mkdir spec/$argv[1]
	rvm use 2.2.1@$argv[1] --create
	gem install bundler
end
