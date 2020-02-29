{-# LANGUAGE OverloadedStrings #-}
import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Client
import           Network.HTTP.Client.TLS
import           Network.HTTP.Simple

main :: IO ()
main = do
    manager <- newManager tlsManagerSettings
    
    let request = setRequestManager manager "https://www.yahoo.co.jp"
    response <- httpLBS request

    putStrLn $ "The status code was: " ++
                show (getResponseStatusCode response)
    print $ getResponseHeader "Content-Type" response
    L8.putStrLn $ getResponseBody response