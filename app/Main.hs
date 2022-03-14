{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
module Main where

import Aws.Lambda
import Data.Text
import qualified Data.Text as Text
import GHC.Generics
import Data.Aeson

main :: IO ()
main =
  runLambdaHaskellRuntime defaultDispatcherOptions (pure ()) id $ do
    addAPIGatewayHandler "gatewayHandler" gatewayHandler

gatewayHandler :: ApiGatewayRequest ()
               -> Context context
               -> IO (Either (ApiGatewayResponse Text) (ApiGatewayResponse Text))
gatewayHandler gatewayReq _context = do
  print gatewayReq
  pure . Right $ ApiGatewayResponse 200 [] (Text.pack $ show gatewayReq) False

data TestResponse = TestResponse {
  testResponse :: Text
} deriving (Eq, Ord, Show, Generic)

instance ToJSON TestResponse
instance FromJSON TestResponse