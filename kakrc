set-option global autoreload yes

addhl global/ number-lines
addhl global/ wrap

# Indentation
# https://github.com/mawww/kakoune/wiki/EditorConfig
hook global WinCreate ^[^*]+$ %{editorconfig-load}
map global insert <tab> '<a-;><gt>'
map global insert <s-tab> '<a-;><lt>'

# Use 'jj' as sequence to escape into
# command mode.
hook global InsertChar j %{
  try %{
        exec -draft hH <a-k>jj<ret> d
        exec <esc>
    }
}

# bc calculator integration as from:
# https://github.com/mawww/kakoune/wiki/Qalculate!
map -docstring 'qalc-bc' global normal = ':prompt math: %{exec "a%val{text}<lt>esc>|qalc -t +u8 -f -<lt>ret>"}<ret>'

source "%val{config}/plugins/plug.kak/rc/plug.kak"

plug "TeddyDD/kakoune-wiki"
wiki-setup "/Users/abelsen/OneDrive/Documents/個人/ウィキ/"

plug "delapouite/kakoune-text-objects"
plug "eraserhd/parinfer-rust"

# fzf setup
plug "andreyorst/fzf.kak"
map global normal <c-p> ': fzf-mode<ret>'

plug "jdugan6240/powerline.kak" config %{
    powerline-start
}

# For toggling between relative and absolute line numbers
# based on the current mode.
plug "evanrelf/number-toggle.kak"
# Use elegant colorscheme
plug "abuffseagull/nord.kak" theme %{ colorscheme nord }
plug 'delapouite/kakoune-livedown'
plug "occivink/kakoune-expand"
plug "lePerdu/kakboard" %{
        hook global WinCreate .* %{ kakboard-enable }
}
plug "caksoylar/kakoune-smooth-scroll"

eval %sh{kak-lsp --kakoune -s $kak_session}
lsp-enable

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

hook global WinSetOption filetype=markdown %{
    # Set the width of a tab to be equal to four characters.
    set buffer tabstop 4
    # Use four spaces on indent.
    set buffer indentwidth 4
}

