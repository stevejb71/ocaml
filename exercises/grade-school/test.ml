open OUnit2
open Grade_school

let assert_list_equals (exp: string list) (got: string list) = 
  assert_equal exp got ~printer:(String.concat ";")

let tests = [
  "an empty school has no students in grade 1" >:: (fun _ ->
    empty_school |> grade 1 |> assert_list_equals []   
  );
  "can find a student in grade 2 after being added to grade 2" >:: (fun _ ->
    empty_school |> add "Emma" 2 |> grade 2 |> assert_list_equals ["Emma"]   
  );
  "cannot find a student in grade 1 after being added to grade 2" >:: (fun _ ->
    empty_school |> add "Emma" 2 |> grade 1 |> assert_list_equals []   
  );
  "can find 3 students in grade 4 after being added to grade 4" >:: (fun _ ->
    let school = empty_school |> add "Emma" 4 |> add "Steve" 4 |> add "Bob" 4 in
    let grade_4_students = grade 4 school in
    let grade_4_students_sorted = List.sort String.compare grade_4_students in
    assert_list_equals ["Bob"; "Emma"; "Steve"] grade_4_students_sorted
  );
  "can find 3 students in sorted order in grade 4 after being added to grade 4 and sort is called" >:: (fun _ ->
    let school = empty_school |> add "Emma" 4 |> add "Steve" 4 |> add "Bob" 4 |> sort in
    let grade_4_students = grade 4 school in
    assert_list_equals ["Bob"; "Emma"; "Steve"] grade_4_students
  )
]

let () =
  run_test_tt_main ("grade-school tests" >::: tests)
