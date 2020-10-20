addhl global/ number-lines
addhl global/ wrap
set-option global indentwidth 4

hook global BufSetOption filetype=ruby %{
        set-option buffer formatcmd "rubocop -x -o /dev/null -s '${kak_buffile}' | sed -n '2,$p'"
}

hook global WinSetOption filetype=ruby %{
        set-option window lintcmd 'rubocop -l --format emacs'
	# Use two spaces per tab
	set buffer tabstop 2
	set buffer indentwidth 2
}

source "%val{config}/plugins/plug.kak/rc/plug.kak"

eval %sh{kak-lsp --kakoune -s $kak_session}

plug "TeddyDD/kakoune-wiki"
plug "delapouite/kakoune-text-objects"
plug "eraserhd/parinfer-rust"
plug "andreyorst/powerline.kak" %{
    hook -once global WinCreate .* %{
        powerline-theme solarized-dark
    }
}
plug "lenormf/kakoune-extra"
plug "alexherbo2/select.kak"
plug "alexherbo2/portal.kak"
plug "andreyorst/smarttab.kak" %{
    set-option global softtabstop 4 # or other preferred value
    set-option global tabstop 4 # or other preferred value
}
plug "abuffseagull/nord.kak" theme %{ colorscheme nord }

wiki-setup "/Users/abelsen/OneDrive/Documents/Personal/Wiki"

hook global InsertChar j %{ try %{
      exec -draft hH <a-k>jj<ret> d
        exec <esc>
}}

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
