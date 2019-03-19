#!/usr/bin/env stack
-- stack --resolver lts-13.0 script
 
{-# LANGUAGE OverloadedStrings #-}  
                                    
import Turtle
import Data.Foldable
import qualified Data.Text as Text

filesToPaths :: [(Text, Text)]
filesToPaths =  [("kakrc"        , "~/.config/kak/")           ,
                 ("init.vim"     , "~/.config/nvim/")          ,
                 ("alacritty.yml", "~/.config/alacritty/")     ,
                 ("config.fish"  , "~/.config/fish/")          ,
                 (".inputrc"     , "~/")                       ,
                 (".tmux.conf"   , "~/")                       ,
                 ("kakrc"        , "~/.config/kak")            ,
                 ("fish_scripts/", "~/fish_scripts/")          ,
                 ("functions/"   , "~/.config/fish/functions/"),
                 ("startup.kak"  , "~/.config/kak/autoload/")  ]

cpToDir :: Text -> Text -> IO ExitCode
cpToDir file path = shell (Text.concat ["cp -rf ", file, " ", path]) empty

mkDir :: Text -> IO ExitCode
mkDir path = shell (Text.concat ["mkdir -p ", path]) empty

main :: IO ()
main = do { mapM_ (\(_, b) -> mkDir     b) filesToPaths
          ; mapM_ (\(a, b) -> cpToDir a b) filesToPaths
          }

