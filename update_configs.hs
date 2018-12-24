#!/usr/bin/env stack
-- stack --resolver lts-13.0 script
 
{-# LANGUAGE OverloadedStrings #-}  
                                    
import Turtle
import Data.Foldable
import qualified Data.Text as Text

filesToPaths :: [(Text, Text)]
filesToPaths =  [(".kakrc", "~/.config/kak/"),
                 ("init.vim", "~/.config/nvim/"),
                 ("alacritty.yml", ".config/alacritty/"),
                 (".inputrc", "~/"),
                 (".tmux.conf", "~/")]

filesToPaths' :: [(Text, Text)]
filesToPaths' =  [(".something", "~/")]

mvToDir :: Text -> Text -> IO ExitCode
mvToDir file path = shell (Text.concat ["mv -f ", file, " ", path]) empty

main = mapM_ (\(a, b) -> do { mvToDir a b
                            })
             filesToPaths'
