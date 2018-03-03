open Base

let raindrop = function
  | n when n % 105 = 0 -> "PlingPlangPlong"
  | n when n % 35 = 0 -> "PlangPlong"
  | n when n % 21 = 0 -> "PlingPlong"
  | n when n % 15 = 0 -> "PlingPlang"
  | n when n % 7 = 0 -> "Plong"
  | n when n % 5 = 0 -> "Plang"
  | n when n % 3 = 0 -> "Pling"
  | n -> Int.to_string n
