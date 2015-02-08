{-
The Black and Scholes (1973) Stock option formula.
See K.Syring, http://www.espenhaug.com/black_scholes.html
-}

blackscholesCall = blackscholes True
blackscholesPut = blackscholes False
blackscholes :: Bool -> Double -> Double -> Double -> Double -> Double -> Double
blackscholes  iscall s x t r v  
	| iscall == True = call
	| otherwise = put
		where
			call = s * normcdf d1 - x*exp (-r*t) * normcdf d2
			put  = x * exp (-r*t) * normcdf (-d2) - s * normcdf (-d1)
			d1 = ( log(s/x) + (r+v*v/2)*t )/(v*sqrt t)
			d2 = d1 - v*sqrt t
normcdf x  
	| x < 0 = 1 - w
	| otherwise = w
		where
			w = 1.0 - 1.0 / sqrt (2.0 * pi) * exp(-l*l / 2.0) * poly k
			k = 1.0 / (1.0 + 0.2316419 * l)
			l = abs x
			poly = horner coeff 
			coeff = [0.0,0.31938153,-0.356563782,1.781477937,-1.821255978,1.330274429] 
			
horner coeff base  = foldr1 multAdd  coeff
	where
		multAdd x y = y*base + x


main = print (normcdf 0.1)