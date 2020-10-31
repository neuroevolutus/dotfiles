addhl global/ number-lines
addhl global/ wrap
set-option global tabstop 2
set-option global indentwidth 2

# bc calculator integration as from:
# https://github.com/mawww/kakoune/wiki/Qalculate!
map -docstring 'qalc-bc' global normal = ':prompt math: %{exec "a%val{text}<lt>esc>|qalc -t +u8 -f -<lt>ret>"}<ret>'

# Word count using "user-key + 'w'" as taken from:
# https://github.com/mawww/kakoune/wiki/Wc
map global user 'w' %{:echo %sh{wc -w <lt><lt><lt> "${kak_selection}"}<ret>}

source "%val{config}/plugins/plug.kak/rc/plug.kak"

eval %sh{kak-lsp --kakoune -s $kak_session}

plug "TeddyDD/kakoune-wiki"
wiki-setup "/Users/abelsen/OneDrive/Documents/Personal/Wiki"

plug "delapouite/kakoune-text-objects"
plug "eraserhd/parinfer-rust"

# fzf setup
plug "andreyorst/fzf.kak"
map global normal <c-p> ': fzf-mode<ret>'

plug "andreyorst/powerline.kak" %{
    hook -once global WinCreate .* %{
        powerline-theme solarized-dark
    }
}
plug "lenormf/kakoune-extra"
plug "andreyorst/smarttab.kak" %{
    set-option global softtabstop 4 # or other preferred value
    set-option global tabstop 4 # or other preferred value
}
# For toggling between relative and absolute line numbers
# based on the current mode.
plug "evanrelf/number-toggle.kak"
# Use elegant colorscheme
plug "abuffseagull/nord.kak" theme %{ colorscheme nord }

plug "occivink/kakoune-expand"
declare-option str expand_commands %{
  expand-impl %{ exec <a-a>b }
  expand-impl %{ exec <a-a>B }
  expand-impl %{ exec <a-a>r }
  expand-impl %{ exec <a-i>i }
  expand-impl %{ exec '<a-:><a-;>k<a-K>^$<ret><a-i>i' } # previous indent level (upward)
  expand-impl %{ exec '<a-:>j<a-K>^$<ret><a-i>i' }      # previous indent level (downward)
}
map -docstring "expand" global user e ': expand<ret>'
# 'lock' mapping where pressing <space> repeatedly will expand the selection
declare-user-mode expand
map -docstring "expand" global expand <space> ': expand<ret>'
map -docstring "expand ↻" global user E       ': expand; enter-user-mode -lock expand<ret>'

hook global InsertChar j %{
  try %{
    exec -draft hH <a-k>jj<ret> d
    exec <esc>
	}
}

# Customize buffer and window options when working with ruby
# files.
hook global BufSetOption filetype=ruby %{
    set-option buffer formatcmd "rubocop -x -o /dev/null -s '${kak_buffile}' | sed -n '2,$p'"
}

hook global WinSetOption filetype=ruby %{
    set-option window lintcmd 'rubocop -l --format emacs'
    # Set the width of a tab to be equal to two characters.
    set buffer tabstop 2
    # Use two spaces on indent.
    set buffer indentwidth 2
    # Replace tabs with spaces.
    expandtab
}

# Be sure to put
#  eval %sh{kak-lsp --kakoune -s $kak_session}
# 
# into your kakrc.
# 
# To customize kak-lsp copy default config from /usr/local/opt/kak-lsp/share/kak-lsp.toml to ~/.config/kak-lsp/kak-lsp.toml and edit it.
# 
# Provided service might be useful if you are using kak-lsp in TCP mode.
# It's not needed for default integration described above.
# 
# To have launchd start ul/kak-lsp/kak-lsp now and restart at startup:
# " sudo brew services start ul/kak-lsp/kak-lsp
# ==> Summary
# 🍺  /usr/local/Cellar/kak-lsp/5.10.0: 6 files, 6.7MB, built in 3 seconds
