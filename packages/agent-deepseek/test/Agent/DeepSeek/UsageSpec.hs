module Agent.DeepSeek.UsageSpec (spec) where

import Agent.DeepSeek.Usage
import qualified Data.ByteString.Lazy.Char8 as LBS
import Test.Hspec

spec :: Spec
spec = do
    describe "decodeBalances" do
        it "decodes string amounts and currency from balance_infos" do
            decodeBalances
                (LBS.pack "{\"balance_infos\":[{\"currency\":\"USD\",\"total_balance\":\"100.00\",\"granted_balance\":\"60.00\",\"topped_up_balance\":\"40.00\"}]}")
                `shouldBe` Right
                    [ BalanceInfo
                        { currency = Just "USD"
                        , totalBalance = Just "100.00"
                        , grantedBalance = Just "60.00"
                        , toppedUpBalance = Just "40.00"
                        }
                    ]

        it "treats every field as optional" do
            decodeBalances (LBS.pack "{\"balance_infos\":[{}]}")
                `shouldBe` Right
                    [ BalanceInfo
                        { currency = Nothing
                        , totalBalance = Nothing
                        , grantedBalance = Nothing
                        , toppedUpBalance = Nothing
                        }
                    ]

        it "hides parser internals for unreadable responses" do
            decodeBalances "not json"
                `shouldBe`
                    Left "DeepSeek returned an unreadable balance response."
