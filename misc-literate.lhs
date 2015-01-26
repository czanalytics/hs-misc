---
format: markdown+lhs
...

A geo-server to monitor expected positions of ship and aircraft  in specified zones.
Hudak (1994) "Haskell vs. Ada [...]".

type Point = Integer -> Integer -> (Integer,Integer)

> data Point = Point Float Float deriving (Show) 
> type Region = Point -> Bool
> type Radius = Integer -> Integer

Additional function to determine whether a point was is in a particular region 
considered to be an elegant form of self-documentation.

> inRegion :: Point -> Region -> Bool
> p `inRegion` r = r p

Functions to create primitive regions, such and functions that combine simple
regions to more complex regions.

 circle :: Radius -> Region -- creates a region
 circle r = r 

 outside :: Region -> Region  -- the logical negation
 outside r = r


 (/\) :: Region -> Region -> Region -- the intersection
 annulus :: Radius -> Radius -> Region
 annulus r1 r2 = outside (circle r1) /\ circle r2 --used to define an engageability zone


Recursion
=========
Source: <http://gitit.net/_showraw/Literate%20Haskell%20Example>.

A recursive implementation for Fibonacci number using guards:

> fibr :: Integer -> Integer
> fibr n
>     | n == 0  = 0
>     | n == 1  = 1
>     | n  > 1  = fibr (n-1) + fibr (n-2)

Alternatively, we can use pattern-matching: 

> fibp :: Integer -> Integer
> fibp 0 = 0
> fibp 1 = 1
> fibp n = fibp (n-1) + fibp (n-2)

Infinite Lists
==============

The recursive definition is elegant but inefficient since for each call of 
fib with n > 1 we are recalculating Fibonacci numbers that had already been calculated before. 
Another issue is the stack, fib is not tail recursive and so we risk a stack overflow.

Let's use Haskell's laziness to define an infinite lazy list taking only linear time.

> fibl :: Integer -> Integer
> fibl n = fibs !! (fromIntegral n)
>   where
>     fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

where `zipWith` builds a new list by taking the head element of each list and applying a function (here +): 

    *Main> zipWith (+) [0,1,2] [3, 4, 5] 
    [3,5,7]

As the list is being calculated, zipWith unfolds as follows:

    0 : 1 : zipWith (+) (0 : 1 : ...) (1 : ...)
    0 : 1 : (0 + 1) : zipWith (+) (1 : 1 : ...) (1 : ...)
    0 : 1 : 1 : (1 + 1) : zipWith (+) (1 : 2 : ...) (2 : ...)
    0 : 1 : 1 : 2 : (1 + 2) : zipWith (+) (2 : 3 : ...) (3 : ...)
