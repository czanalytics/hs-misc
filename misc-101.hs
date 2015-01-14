-- haskell.hs Usage: ghc hs.hs, ./hs.hs
-- or ghci, :l hs, and see x with x<enter>, name x
{-- 

module Main where
main = putStrLn "Hello!" --}

module Main where
c = putStrLn "C!"

averageOf2 = \x y -> (x + y)/ 2

isNeg = (< 0)

vec = [1] ++ [2]
vec' = 1 : [2] -- cons
hi' = "Hi!"
str'  = 'a' : "bc" 

ch = "abc" !! 0 -- gives 'a'
letters = ['a'..'z']

lis = [[1,2],[3,4]]
lis0 = lis !! 0
lis1 = lis ++ [[5,6]]

car = head lis1
cdr = tail lis1
l = length cdr

fact :: Int -> Int -- see with ':t fact'
fact 0 = 1
fact n = n * fact (n-1)

fac1 n
    | n == 0    = 1
    | otherwise = n * fac1 (n - 1)

fac2 n = case n of
       0 -> 1
       n -> n * fac2 (n - 1)

fac3 n = if n==0 then 1
                 else n * fac3 (n - 1)

fac4 n 
     | n==0      = 1
     | otherwise = n * fac4 m
     where m = n - 1

zip1 = zip [1,2] [3,4]
st = fst (1,2)
nd = snd (3,4)

x = ("AH", 'm', 47)
name (x, _, _) = x
gender (_, x, _) = x
age (_, _, x) = x


sqr n = [sqrt x | x <- [1..n]]

tri = [(a,b,c)| c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2]         

qs :: (Ord a) => [a] -> [a] -- quicksort
qs [] = []
qs (pivot:xs) =
    qs [x | x <- xs, x <  pivot] ++
    [pivot] ++
    qs [x | x <- xs, x >= pivot]

combine before after =
  do before
     putStrLn "Middle"
     after

main = do combine c c 
          let b = combine (putStrLn "Hello") (putStrLn "Bye")
          let d = combine (b) (combine c c)
          putStrLn "Hello!"
