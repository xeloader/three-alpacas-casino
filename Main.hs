import Test.HUnit
import qualified Games.BlackJack as BJ
import qualified Games.GoFish as GF

import Engine
import Card
import Hand
import Game
import Deck

main :: IO ()
main = do
  putStrLn "Welcome to Playboy Casino."
  putStrLn $ show (Hand [(Card Diamonds A BJ), (Card Spades (Other 5) BJ), (Card Clubs K BJ), (Card Diamonds (Other 2) BJ)] BJ)

{- TESTS -}
runtests = runTestTT $ TestList [testListHand, testListDeck, testListCard]
