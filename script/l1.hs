-- Simple script used in Lesson 1.2
-- https://youtu.be/ybba5tcOeEY

sqDist :: Num a => a -> a -> a
sqDist x y = x^2 + y^2

main :: IO ()
main = print (sqDist 3 4 + sqDist 7 8)