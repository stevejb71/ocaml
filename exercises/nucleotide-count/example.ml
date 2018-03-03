open Base

let emptyCharMap = Map.empty (module Char)

let count s c =
    let f n c' = if Char.(c = c') then n + 1 else n in
    String.fold ~init:0 ~f s

let nucleotide_counts s =
    let f m c = Map.change m c ~f:(function None -> Some 1 | Some n -> Some (n + 1)) in
    String.fold ~init:emptyCharMap ~f s
