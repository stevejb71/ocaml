open Base

module CharSet = Set.M(Char)

let string_to_set (s: string): CharSet.t = Set.of_list CharSet.comparator (String.to_list_rev s)

let alphabet_set: CharSet.t = string_to_set "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

let is_pangram s = 
  let normalize s = String.filter ~f:Char.is_alpha s |> String.uppercase in
  Set.equal alphabet_set (string_to_set @@ normalize s)