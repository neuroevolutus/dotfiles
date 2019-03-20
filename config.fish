fish_vi_key_bindings

# https://superuser.com/questions/863538/tmux-execute-command-in-session-on-startup
# Trimming whitespace: https://unix.stackexchange.com/questions/102008/how-do-i-trim-leading-and-trailing-whitespace-from-each-line-of-some-output
# if test -n (printf "$TMUX" | sed 's/^[ \t]*//;s/[ \t]*$//')
#    and test (tmux list-sessions | wc -l | sed 's/^[ \t]*//;s/[ \t]*$//') -gt 1;
#    tmux list-sessions | awk '{print $1}' | grep 0 | wc -l | sed 's/^[ \t]*//;s/[ \t]*$//' | read -l num;
#    # https://stackoverflow.com/questions/1786888/in-bash-shell-script-how-do-i-convert-a-string-to-an-number
#    if test (printf "$num > 0\n"| bc) -eq "1";
#    and test -z $ALREADY_RAN_TMUX_STARTUP;
#     set ALREADY_RAN_TMUX_STARTUP true;
#     fish ~/fish_scripts/tmux_startup.fish;
#    end;
# end
    

set TERM xterm-256color

set LANG en_US.UTF-8
set LC_COLLATE en_US.UTF-8
set LC_CTYPE en_US.UTF-8
set LC_MESSAGES en_US.UTF-8
set LC_MONETARY en_US.UTF-8
set LC_NUMERIC en_US.UTF-8
set LC_TIME en_US.UTF-8
set LC_ALL en_US.UTF-8

set EDITOR /usr/local/bin/kak

# https://github.com/fish-shell/fish-shell/issues/527, 3rd comment down                 (properly appending to PATH)
# https://stackoverflow.com/questions/51597846/tmux-fish-shell-conf-being-sourced-twice (Avoiding adding to PATH unnecessarily)

contains $HOME/.cargo/bin              $PATH; or set PATH $HOME/.cargo/bin              $PATH
contains $HOME/.local/bin/             $PATH; or set PATH $HOME/.local/bin/             $PATH
contains /opt/local                    $PATH; or set PATH /opt/local                    $PATH
contains /usr/local/opt/go/libexec/bin $PATH; or set PATH /usr/local/opt/go/libexec/bin $PATH
contains $HOME/.my_applications        $PATH; or set PATH $HOME/.my_applications        $PATH

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
