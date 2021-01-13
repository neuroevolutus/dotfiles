for font in (brew search --casks | grep nerd)
    brew cask install $font
end
