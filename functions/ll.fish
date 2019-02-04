function ll --description "Prints directory listing using `exa -l`. `exa` works like `ls` but prettier."
	exa -l --git --time-style=full-iso
end
