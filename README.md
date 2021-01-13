# Dotfiles
This repository contains configuration files for programming languages and tools that I use as well as some miscellaneous configuration files for things such as Spicetify (for Spotify customization) as well as SurfingKeys (for quickly navigating webpages using keybindings).

## Main Tools
My main drivers include using Kakoune as a text editor, ZSH as my default shell program, and Ruby for general-purpose programming.

## Theme of Choice
My favorite theme for customizing terminal as well as GUI applications is [Nord][Nord]. You can see my Nord theme customizations in the `dir_colors` folder, the `spicetify_data` folder, and my `kakrc` file.

## Using the dotfiles
The following has only been tested on my Macbook. Some changes are likely needed to make this process work on Windows and Linux.

Make sure you have the `gh` command (the [Github CLI][Github CLI]), [Ruby][Ruby] and [Bundler][Bundler] installed, in particular by changing the "update_configs.rb" file.

Run `gh repo clone neuroevolutus/dotfiles` in a directory of your choice. `cd` into the "dotfiles" folder, and then run `bundle install`. Edit the lines with `file_to_dir` in "update_configs.rb" to change the mapping of the files contained in this repository to the desired paths to which they should be copied. Finally, make sure you have run `chmod +x update_configs.rb` once. From now on, you should be able to run `ruby update_configs.rb` from within the repository directory to have the dotfiles from the repo be copied to the appropriate directories on your system.

[Nord]: https://www.nordtheme.com
[Ruby]: https://www.ruby-lang.org/en/
[Bundler]: https://bundler.io/
[Github CLI]: https://cli.github.com/
