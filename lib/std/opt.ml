let bind = Option.bind

let map x f = Option.map f x

let product a b =
  match (a, b) with Some a, Some b -> Some (a, b) | _ -> None

(* Bindings *****************************************************************)
let ( let>? ) = bind

let ( let|? ) = map

let ( and*? ) = product

(* Infixes ******************************************************************)
let ( >>? ) = bind

let ( >|? ) = map

let ( <*?> ) = product

let ( |? ) o def = match o with None -> def | Some x -> x
