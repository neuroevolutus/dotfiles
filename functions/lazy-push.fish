function lazy-push
	git add .
	git commit -a -m $argv[1]
	git push
end