
module Basics = struct
  
  exception Error
  
  type token = 
    | INT of (
# 1 "parser.mly"
       (int)
# 11 "parser.ml"
  )
  
end

include Basics

let _eRR =
  Basics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state

let rec question : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 3 "parser.mly"
       (string option)
# 33 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env =
      let (_menhir_env : _menhir_env) = _menhir_env in
      ((let lexer = _menhir_env._menhir_lexer in
      let lexbuf = _menhir_env._menhir_lexbuf in
      let _tok = lexer lexbuf in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
        let (_v : (
# 1 "parser.mly"
       (int)
# 69 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        let ((i : (
# 1 "parser.mly"
       (int)
# 76 "parser.ml"
        )) : (
# 1 "parser.mly"
       (int)
# 80 "parser.ml"
        )) = _v in
        ((let _v : (
# 3 "parser.mly"
       (string option)
# 85 "parser.ml"
        ) = 
# 8 "parser.mly"
  (i)
# 89 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5) = _menhir_stack in
        let (_v : (
# 3 "parser.mly"
       (string option)
# 96 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
        let (_v : (
# 3 "parser.mly"
       (string option)
# 103 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
        let ((_1 : (
# 3 "parser.mly"
       (string option)
# 110 "parser.ml"
        )) : (
# 3 "parser.mly"
       (string option)
# 114 "parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv2)) : 'freshtv4)) : 'freshtv6)) : 'freshtv8)) : 'freshtv10)) : 'freshtv12))

# 220 "/home/steve/.opam/4.04.0/lib/menhir/standard.mly"
  


# 122 "parser.ml"
