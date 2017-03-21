open Core.Std
open OUnit2
open Wordy

let ae exp got _test_ctxt = assert_equal exp got ~printer:(Option.value_map ~f:Int.to_string ~default:"None")

let tests = [
(* TEST
   "$description" >::
     ae $expected (answer $input);
   END TEST *)
]

let () =
  run_test_tt_main (
    "wordy tests" >::: tests
  )