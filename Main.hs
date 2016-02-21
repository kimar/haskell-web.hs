{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Text.Lazy.Encoding (decodeUtf8)
import Network.Wai.Middleware.RequestLogger

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev

  -- take POST / and print body as text
  post "/" $ do
    jsonString <- decodeUtf8 <$> body
    text jsonString
