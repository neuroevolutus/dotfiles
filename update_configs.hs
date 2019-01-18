#!/usr/bin/env stack
-- stack --resolver lts-13.0 script
 
{-# LANGUAGE OverloadedStrings #-}  
                                    
import Turtle
import Data.Foldable
import qualified Data.Text as Text

filesToPaths :: [(Text, Text)]
filesToPaths =  [("kakrc", "~/.config/kak/"),
                 ("init.vim", "~/.config/nvim/"),
                 ("alacritty.yml", "~/.config/alacritty/"),
                 ("config.fish", "~/.config/fish/"),
                 (".inputrc", "~/"),
                 (".tmux.conf", "~/"),
                 ("kakrc", "~/.config/kak"),
                 ("startup.kak", "~/.config/kak/autoload/")]

cpToDir :: Text -> Text -> IO ExitCode
cpToDir file path = shell (Text.concat ["cp -f ", file, " ", path]) empty

main = mapM_ (\(a, b) -> cpToDir a b) filesToPaths
