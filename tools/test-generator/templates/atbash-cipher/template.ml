open Core.Std
open OUnit2
open Atbash_cipher

let ae exp got _test_ctxt = assert_equal ~printer:String.to_string exp got

let (* SUITE *)$(suite_name)_tests = [
(* TEST
  "$description" >::
    ae "$expected" ($suite-name "$phrase");
END TEST *)
]
(* END SUITE *)

let () =
  run_test_tt_main ("atbash cipher" >::: List.concat [(* suite-all-names *)])

(* ADD THIS TEST TO encode_tests *)
(* "encode mindblowingly with a different block size">::
  ae "n r m w y o l d r m t o b" (encode ~block_size:1 "mindblowingly"); *)
