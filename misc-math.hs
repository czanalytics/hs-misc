-- usage: :l misc-math > solveQdr (1,-1,-1)

-- guadratic equation, abstract over tuple
solveQdr :: (Float,Float,Float) -> (Float,Float)
solveQdr = \ (a,b,c) -> if a==0 then error "not quadratic"
	     else let d = b^2 - 4*a*c in
	     if d < 0 then error "no real solutions"
	     else
	     ((- b + sqrt d) / 2*a,
	      (- b - sqrt d) / 2*a)

