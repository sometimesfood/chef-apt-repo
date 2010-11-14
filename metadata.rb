maintainer       "Sebastian Boehm"
maintainer_email "sebastian@sometimesfood.org"
license          "MIT"
description      "Add APT repositories"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
#version          "0.1"

%w(ubuntu debian).each do |os|
  supports os
end
