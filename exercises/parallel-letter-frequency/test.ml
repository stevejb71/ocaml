open Base
open OUnit2
open Text
open Parallel_letter_frequency

let assert_int_eq = assert_equal ~printer:Int.to_string
let ae exp got _test_ctxt = assert_int_eq exp got

let poem = {str|Oh, would some Power give us the gift\
To see ourselves as others see us!\
It would from many a blunder free us,\
And foolish notion:\
What airs in dress and gait would leave us,\
And even devotion!|str}

let tests = [
  "frequencies from empty text has 0 for letter A" >:: (
    ae 0 (create_frequencies (from_string "") |> frequency_for ~letter:'A')
  );
  "frequencies from text with just letter A has 1 for letter A" >:: (
    ae 1 (create_frequencies (from_string "A") |> frequency_for ~letter:'A')
  );
  "frequencies from text with two letter As has 2 for letter A" >:: (
    ae 2 (create_frequencies (from_string "AA") |> frequency_for ~letter:'A')
  );
  "frequencies from text with two letter As and one letter a has 1 for letter a" >:: (
    ae 1 (create_frequencies (from_string "AaA") |> frequency_for ~letter:'a')
  );
  "smoke test on frequencies for the poem passes" >:: (fun _ ->
    let fs = create_frequencies (from_string poem) in
    assert_int_eq 1 (frequency_for fs ~letter:'O');
    assert_int_eq 15 (frequency_for fs ~letter:'o');
    assert_int_eq 9 (frequency_for fs ~letter:'u');
  );
  "handles a very long string" >:: (fun _ -> 
    let num_copies = 10 in (* increase this for a performance test *)
    let fs_single = create_frequencies (from_string poem) in
    let many_copies = String.concat ~sep:"" (Array.to_list (Array.create ~len:num_copies poem)) in
    let fs_many = create_frequencies (from_string many_copies) in
    let check_consistent ch = 
      let frequency_for = frequency_for ~letter:ch in
      assert_int_eq (frequency_for fs_single * num_copies) (frequency_for fs_many); in
    String.iter "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQSTUVWXYZ" ~f:check_consistent;
  )
]

let () =
  run_test_tt_main ("parallel letter frequency tests" >::: tests)