#!/bin/sh

for i in \
	".tmux.conf $HOME/" \
	 ".zshrc $HOME/" \
	 "init.vim $HOME/.config/nvim/" \
	# "kakrc $HOME/.config/kak/" \
	 # "alacritty.yml $HOME/.config/alacritty/" \
	 # "config.fish $HOME/.config/fish/" \
	 # ".inputrc $HOME/" \
	 # "kakrc $HOME/.config/kak" \
	 # "fish_scripts/ $HOME/fish_scripts/" \
	 # "functions/ $HOME/.config/fish/functions/" \
	 # "startup.kak $HOME/.config/kak/autoload/" \
	 # "spicetify_data/ $HOME/spicetify_data/" \
	 # "slack_theme.txt $HOME/"
do
	set -- $i
	cp -r "./$1" $2
done
