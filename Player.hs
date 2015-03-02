module Player where

  import Test.HUnit
  import Deck
  import Hand

  data PlayerRole = Dealer
                  | Shark

  data PlayerState = State String
                   | UndefinedState

  data GamePlayer = Player PlayingHand PlayerRole PlayerState

  instance Show PlayerRole where
    show Dealer = "Dealer"
    show Shark = "Shark"

  instance Show PlayerState where
    show (State state) = state
    show UndefinedState = "Undefined Status"

  instance Show GamePlayer where
    show (Player hand role state) = "[" ++ show(role) ++ ", " ++ show(state) ++ "] " ++ show(hand)

  instance Eq PlayerState where
    (==) (State stateA) (State stateB) = stateA == stateB
    (==) UndefinedState UndefinedState = True
    (==) _ _ = False

  {-
    PURPOSE: create a player, aka shark.
  -}
  createShark :: GamePlayer
  createShark = (Player EmptyHand Shark UndefinedState)

  {-
    PURPOSE: create a dealer
  -}
  createDealer :: GamePlayer
  createDealer = (Player EmptyHand Dealer UndefinedState)

  
