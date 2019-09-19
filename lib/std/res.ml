let bind = Result.bind

let map x f = Result.map f x

let product a b =
  match (a, b) with
  | Ok a, Ok b -> Ok (a, b)
  | Ok _, Error e | Error e, _ -> Error e

(* Bindings *****************************************************************)
let ( let>& ) = bind

let ( and>& ) = product

let ( let|& ) = map

let ( and|& ) = product

(* Infixes ******************************************************************)
let ( >>& ) = bind

let ( <<& ) f x = bind x f

let ( >|& ) = map

let ( >|&! ) x f = Result.map_error f x

let ( <|& ) f x = map x f

let ( <|&! ) = Result.map_error

let ( <*&> ) = product
