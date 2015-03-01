module Game where

  {- DATA -}

  data Game = None
            | BJ
            | TX
            | P5
            | GF deriving(Enum)

  class GameValue a where
    valueOf :: a -> Int

  {- INSTANCES -}

  instance Show Game where
    show BJ = "Black Jack"
    show GF = "Go Fish"
    show TX = "Texas Hold'Em"
    show P5 =  "Poker"
    show None = "Undefined Game"

  {- FUNCTIONS -}

  {-
    PURPOSE: Return every game that we're adding, may use it in a list
      at the Playboy Casino home screen.
  -}
  everyGame :: [Game]
  everyGame = [BJ ..] --thanks to deriving(Enum) we can do this.

  {-
    PURPOSE: return an integer that denotes the number of games available.
  -}
  gameCount :: Int
  gameCount = length everyGame


  {-
    PURPOSE: Provide the player with a list of all the games available.
  -}
  printGameTable :: [Game] -> IO ()
  printGameTable [] = putStrLn "Playboy Casino is out of poison."
  printGameTable games =
    let
      printGameTable' :: [Game] -> Int -> IO ()
      printGameTable' [] _ = return ()
      printGameTable' (game:rest) acc = do
        putStrLn ("[" ++ show(acc) ++ "] " ++ show(game))
        printGameTable' rest (acc + 1)
    in
      do
        putStrLn("[n] GAME")
        putStrLn("-------------------------------")
        printGameTable' games 1
        putStrLn("Please pick your poison [1 - " ++ show(gameCount) ++ "]: ")

  {-
    PURPOSE: Return the number of players you're required to be to play a certain
      game.
  -}
  minimumOfPlayers :: Game -> Int
  minimumOfPlayers None = 0
  minimumOfPlayers BJ = 1
  minimumOfPlayers GF = 2
  minimumOfPlayers TX = 2
