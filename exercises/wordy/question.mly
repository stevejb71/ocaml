%token <int> INT

%start <string option> question
%%

question:
| i = INT
  {i}
;
