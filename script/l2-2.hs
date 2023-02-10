-- Simple script used in Lessons 2.2
-- https://youtu.be/https://youtu.be/a6IkhX1zgXI

-- 'Void' is a type having no values (i.e. an empty set)
-- therefore it cannot be constructed, nor used
-- however 'id :: Void -> Void' is a perfectly valid function, albeit uncallable
-- as is 'absurd :: Void -> a'
-- NB: truth be told, every Haskell type has an extra special value "bottom",
-- which lazily signifies a neverending computation

-- 'Unit' is a type having one value (i.e. singleton set)
-- it corresponds to C/C++ 'void'
data Unit = U
-- syntax for type definition is
-- data Typename_with_capital_letter = Data_constructor_with_capital_letter

-- operators can be used as type names and constructors; they can even be the same!
-- data () = () -- as defined in the prelude

-- To create a generic type, you use a type constructor followed by type variables
data Product a b = P a b
-- NB: a built-in pair/product is defined using an operator
-- data (,) a b = (,) a b


-- since variables are immutable in Haskell, you can pattern match on their data constructor!
sqDist :: Num a => Product a a -> a
sqDist (P x y) = x^2 + y^2


main :: IO ()
main = print $ sqDist (P 1 2)
