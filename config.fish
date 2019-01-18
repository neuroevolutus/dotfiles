fish_vi_key_bindings
set -x TERM xterm-256color

set -x LANG en_US.UTF-8
set -x LC_COLLATE en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_MESSAGES en_US.UTF-8
set -x LC_MONETARY en_US.UTF-8
set -x LC_NUMERIC en_US.UTF-8
set -x LC_TIME en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x EDITOR /usr/local/bin/nvim

set -x PATH $HOME/.cargo/bin $PATH

set -x PATH ~/.local/bin/ $PATH
set -x PATH /opt/local $PATH
set -x PATH /usr/local/opt/go/libexec/bin $PATH

thefuck --alias | source
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
