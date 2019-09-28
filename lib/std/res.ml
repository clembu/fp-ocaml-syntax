let bind = Result.bind

let map x f = Result.map f x

let rmap x f = match x with Error e -> Error (f e) | Ok ok -> Ok ok

let product a b =
  match (a, b) with
  | Ok a, Ok b -> Ok (a, b)
  | Ok _, Error e | Error e, _ -> Error e

let rproduct a b =
  match (a, b) with
  | Error a, Error b -> Error (a, b)
  | Error _, Ok ok | Ok ok, _ -> Ok ok

(* Bindings *****************************************************************)
let ( let>& ) = bind

let ( let|& ) = map

let ( and*& ) = product

(* Infixes ******************************************************************)
let ( >>& ) = bind

let ( >|& ) = map

let ( >|! ) = rmap

let ( <*&> ) = product

let ( <*!> ) = rproduct
