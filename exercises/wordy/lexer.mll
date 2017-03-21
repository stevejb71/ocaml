{
  open Core.Std
  open Parser
}

let int = '-'? ['0'-'9']+ 

rule read =
  parse
  | int   {INT (String.of_int (Lexing.lexeme lexbuf)) }