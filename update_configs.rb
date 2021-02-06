# typed: strict
# frozen_string_literals: true

require 'sorbet-runtime'
require 'fileutils'

extend T::Sig

file_to_dir = T.let({}, T::Hash[String, String])

HOME_DIR = T.let(Dir.home + "/", String)

file_to_dir[".editorconfig"         ] = HOME_DIR
file_to_dir[".gemrc"                ] = HOME_DIR
file_to_dir[".gitconfig"            ] = HOME_DIR
file_to_dir[".ruby-version"         ] = HOME_DIR
file_to_dir[".tmux.conf"            ] = HOME_DIR
file_to_dir[".zshrc"                ] = HOME_DIR
file_to_dir["kakrc"                 ] = HOME_DIR + ".config/kak/"
file_to_dir["kitty/"                ] = HOME_DIR + ".config/"
file_to_dir["spicetify_data/"       ] = HOME_DIR
file_to_dir["config.toml"           ] = "/Users/abelsen/Library/Application Support/org.nushell.nu/"

file_to_dir[ "/Users/abelsen/Library/Application Support/org.nushell.nu/"                ] = HOME_DIR + "config.toml"

file_to_dir.each_pair do |file, directory|
  FileUtils.cp_r file, directory
end
