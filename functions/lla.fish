function lla --description "Prints directory listing using `exa -la`. `exa` works like `ls` but prettier."
	exa -la --git --time-style=iso
end
