open Base

module IntMap = Map.M(Int)
type school = string list IntMap.t

let empty_school = Map.empty (module Int)

let add s g school = Map.add_multi ~key:g ~data:s school

let grade g school = Map.find school g |> Option.value ~default:[]

let sort (school : school) = Map.map ~f:(List.sort ~cmp:String.compare) school
