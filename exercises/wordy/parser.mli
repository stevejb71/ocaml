
(* The type of tokens. *)

type token = 
  | INT of (int)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val question: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (string option)
