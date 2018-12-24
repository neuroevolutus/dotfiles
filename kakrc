source "%val{config}/plugins/plug.kak/rc/plug.kak"

eval %sh{kak-lsp --kakoune -s $kak_session}

plug "delapouite/kakoune-text-objects"
plug "eraserhd/parinfer-rust"
plug "andreyorst/powerline.kak" %{
    hook -once global WinCreate .* %{
        powerline-theme solarized-dark
    }
}
plug "lenormf/kakoune-extra"

hook global InsertChar j %{ try %{
      exec -draft hH <a-k>jj<ret> d
        exec <esc>
}}

hook global InsertChar \t %{ try %{
      execute-keys -draft "h<a-h><a-k>\A\h+\z<ret><a-;>;%opt{indentwidth}@"
}}

hook global InsertDelete ' ' %{ try %{
      execute-keys -draft 'h<a-h><a-k>\A\h+\z<ret>i<space><esc><lt>'
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
