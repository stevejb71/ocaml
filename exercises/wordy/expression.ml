type operator = Add | Subtract | Multiply | Divide

type expression = 
  Number of int | 
  Expr of {lhs: expression; op: operator; rhs: expression}

let op_function = function
| Add -> (+)
| Subtract -> (-)
| Multiply -> ( * )   (* needs spaces else it's a comment *)
| Divide -> (/)

let rec evaluate = function
| Number n -> n
| Expr {lhs; op; rhs} -> (op_function op) (evaluate lhs) (evaluate rhs)  

