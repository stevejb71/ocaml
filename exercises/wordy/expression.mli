type operator = Add | Subtract | Multiply | Divide

type expression = 
  Number of int | 
  Expr of {lhs: expression; op: operator; rhs: expression}

val evaluate : expression -> int
