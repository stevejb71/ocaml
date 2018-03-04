open Base

type t = string

let read text index =
  Thread.delay 0.01;
  text.[index]

let length = String.length

let from_string = Fn.id