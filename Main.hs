{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Text.Lazy.Encoding (decodeUtf8)

main :: IO ()
main = scotty 3000 $ do
  post "/" $ do
    jsonString <- decodeUtf8 <$> body
    text jsonString
