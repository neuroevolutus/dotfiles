fish_vi_key_bindings

set TERM xterm-256color

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
