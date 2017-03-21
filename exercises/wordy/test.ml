open Core.Std
open OUnit2
open Wordy

let ae exp got _test_ctxt = assert_equal exp got ~printer:(Option.value_map ~f:Int.to_string ~default:"None")

let tests = [
   "addition" >::
     ae (Some 2) (answer "What is 1 plus 1?");
   "more addition" >::
     ae (Some 55) (answer "What is 53 plus 2?");
   "addition with negative numbers" >::
     ae (Some (-11)) (answer "What is -1 plus -10?");
   "large addition" >::
     ae (Some 45801) (answer "What is 123 plus 45678?");
   "subtraction" >::
     ae (Some 16) (answer "What is 4 minus -12?");
   "multiplication" >::
     ae (Some (-75)) (answer "What is -3 multiplied by 25?");
   "division" >::
     ae (Some (-11)) (answer "What is 33 divided by -3?");
   "multiple additions" >::
     ae (Some 3) (answer "What is 1 plus 1 plus 1?");
   "addition and subtraction" >::
     ae (Some 8) (answer "What is 1 plus 5 minus -2?");
   "multiple subtraction" >::
     ae (Some 3) (answer "What is 20 minus 4 minus 13?");
   "subtraction then addition" >::
     ae (Some 14) (answer "What is 17 minus 6 plus 3?");
   "multiple multiplication" >::
     ae (Some (-12)) (answer "What is 2 multiplied by -2 multiplied by 3?");
   "addition and multiplication" >::
     ae (Some (-8)) (answer "What is -3 plus 7 multiplied by -2?");
   "multiple division" >::
     ae (Some 2) (answer "What is -12 divided by 2 divided by -3?");
   "unknown operation" >::
     ae None (answer "What is 52 cubed?");
   "Non math question" >::
     ae None (answer "Who is the President of the United States?");
]

let () =
  run_test_tt_main (
    "wordy tests" >::: tests
  )