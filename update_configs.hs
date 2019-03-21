#!/usr/bin/env stack
-- stack --resolver lts-13.0 script
 
{-# LANGUAGE OverloadedStrings #-}  
                                    
import Turtle
import Data.Foldable
import qualified Data.Text as Text

data OS = MAC | WINDOWS | LINUX

filesToPaths :: [(Text, Text)]
filesToPaths =  [("kakrc"           , "$HOME/.config/kak/")           ,
                 ("init.vim"        , "$HOME/.config/nvim/")          ,
                 ("alacritty.yml"   , "$HOME/.config/alacritty/")     ,
                 ("config.fish"     , "$HOME/.config/fish/")          ,
                 (".inputrc"        , "$HOME/")                       ,
                 (".tmux.conf"      , "$HOME/")                       ,
                 ("kakrc"           , "$HOME/.config/kak")            ,
                 ("fish_scripts/"   , "$HOME/fish_scripts/")          ,
                 ("functions/"      , "$HOME/.config/fish/functions/"),
                 ("startup.kak"     , "$HOME/.config/kak/autoload/")  ,
                 ("spicetify_data/" , "$HOME/spicetify_data/")        ,
                 ("slack_theme.txt" , "$HOME/")                       ]

cpToDir :: Text -> Text -> IO ExitCode
cpToDir file path = shell (Text.concat ["cp -rf ", file, " ", path]) empty

mkDir :: Text -> IO ExitCode
mkDir path = shell (Text.concat ["mkdir -p ", path]) empty

main :: IO ()
main = do { mapM_ (\(_, b) -> mkDir     b) filesToPaths
          ; mapM_ (\(a, b) -> cpToDir a b) filesToPaths
          }

