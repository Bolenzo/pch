-- Simple script used in Lessons 2.1
-- https://youtu.be/oQ4fvA1OEcY

-- Function taking a single tuple argument
sqDist :: Num a => (a, a) -> a
sqDist (x, y) = x^2 + y^2 -- implementation using pattern matching
-- sqDist p = (fst p)^2 + (snd p)^2 -- implementation using extraction (imho horrible)

-- Function composition
dist :: (Double, Double) -> Double
-- dist p = sqrt $ sqDist p -- explicit definition using an argument and function application
dist = sqrt . sqDist -- point-free definition using function composition

-- Identity function, using parametric polymorphism
id :: a -> a
id x = x

-- Another function example, using two type variables
flop :: (a, b) -> (b, a)
flop (x, y) = (y, x)
-- flop p = (snd p, fst p) -- alternative definition without pattern matching

-- Currying: equivalence between function taking a tuple and a function taking multiple arguments,
-- which can be partially applied
curriedSqDist :: Num a => a -> a -> a
curriedSqDist x y = sqDist (x, y)

-- Partial function application (Currying)
-- A function of two arguments can be seen as a function taking an argument and producing a function
square :: Num a => a -> a
square = curriedSqDist 0

-- Partial application can be applied to operators as well
inc :: Num a => a -> a
-- inc x = 1 + x -- "full" definition
inc = (+ 1) -- point-free definition, using partial application

-- $ is a function application with very low precedence; it is right associative
main :: IO ()
main = print . Main.id $ flop (square $ dist (inc 2, 4), "Hello")
