open Base

type nucleotide = A | C | G | T

let eq = function
| (A, A) -> true
| (C, C) -> true
| (G, G) -> true
| (T, T) -> true
| _ -> false

let hamming_distance a b =
  List.zip a b |> Option.map ~f:(List.count ~f:(Fn.non eq))
