open Base
open Async
open Text

module CharMap = Map.M(Char)
type freqs = int CharMap.t
let empty = Map.empty (module Char)

type rpc = unit

let create_frequency_array () = Array.create ~len:256 0

let split_text length parts =
  if length < parts then [(0, length)]
  else
    let parts_len = Float.to_int (1. +. Float.of_int length /. Float.of_int parts) in
    let rec go start acc =
      if start + parts_len <= length then
        go (start + parts_len) ((start, parts_len) :: acc)
      else 
        (start, length - start) :: acc
    in
    if parts_len <= 1 then [(0, length)] else go 0 []

let add_frequencies_arrays freqs =
  let add f1 f2 =
    Array.iteri f2 ~f:(fun i n -> f1.(i) <- f1.(i) + n)
  in 
  let res = create_frequency_array () in
  Array.iter freqs ~f:(fun xs -> add res xs);
  res

let create_frequencies_array text (start, length) =
  let res = create_frequency_array () in 
  for i = start to start + length - 1 do
    let index = Char.to_int (read text i) in
    res.(index) <- res.(index) + 1;
  done;
  res 

let array_to_map freqs =
  Array.foldi freqs ~init:empty ~f:(fun index m freq ->
    if freq = 0 then m else Map.set m ~key:(Char.of_int_exn index) ~data:freq
  )

let create_frequencies text = 
  let parts = split_text (length text) 4 in
  let parts_frequencies = Array.map (List.to_array parts) ~f:(create_frequencies_array text) in
  add_frequencies_arrays parts_frequencies |> array_to_map

let frequency_for m ~letter = Map.find m letter |> Option.value ~default:0 
