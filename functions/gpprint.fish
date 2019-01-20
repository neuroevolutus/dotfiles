function gpprint --description "Does pretty formatted git log graph print output"
	# Taken from http://garmoncheg.blogspot.com/2012/06/pretty-git-log.html
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --
end
