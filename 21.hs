import System.Random  

main :: IO ()
main = do
  putStrLn "Welcome to this simple 21 game"
  gen <- getStdGen
  gameLoop 0 gen
  
 
gameLoop   ::  Int -> StdGen -> IO ()
gameLoop total gen = do
  putStrLn "Press key to get a number"
  line <- getLine
  putStrLn "Number will be generated"
  let generator = askForNumber gen
  let newNumber = fst generator
  let newGen = snd generator
  putStrLn ("Generated number is :" ++ (show newNumber))
  let newTotal = sumOfNumbers newNumber total
  if(newTotal < 21)
	then executeNext newTotal newGen
	else
	  if(newTotal > 21)
		  then executeLose
		  else executeWin

		  
executeNext ::  Int -> StdGen -> IO ()
executeNext total newGen = do
						   putStrLn ("Total so far: " ++ (show total) )
						   gameLoop total newGen
		  
executeLose :: IO()
executeLose = do
			   putStrLn "Over 21, you lose ..."
			   return ()

executeWin :: IO()
executeWin = do 
				putStrLn("you win")
				return ()
  
  
sumOfNumbers :: Int ->  Int -> Int
sumOfNumbers number1 number2 =  number1 + number2


askForNumber :: StdGen -> (Int, StdGen)  
askForNumber gen = do  
    let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)  
    (randNumber, newGen)

             
						

 