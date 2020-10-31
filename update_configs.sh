#!/bin/sh

for i in \
	".tmux.conf $HOME/" \
	 ".zshrc $HOME/" \
	 "init.vim $HOME/.config/nvim/" \
	 "spicetify_data/ $HOME/spicetify_data/" \
	 "alacritty.yml $HOME/.config/alacritty/" \
	 "kakrc $HOME/.config/kak/" \
	 # "startup.kak $HOME/.config/kak/autoload/" \
	 # "config.fish $HOME/.config/fish/" \
	 # ".inputrc $HOME/" \
	 # "kakrc $HOME/.config/kak" \
	 # "fish_scripts/ $HOME/fish_scripts/" \
	 # "functions/ $HOME/.config/fish/functions/" \
	 # "slack_theme.txt $HOME/"
do
	set -- $i
	cp -r "./$1" $2
done
